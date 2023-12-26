function [corrden,e0,e1] = ArticleClustBrowBern(parmvet,n,mc,data,publi_pic)

timelen = 80;
m = mc*n;

browns = CreateBrown(m, timelen, 1, 0);
alpha = sqrt(1/n);
varcorrect = 1;


data_sets = cell(1,length(parmvet));
if data == 0
for genpars = 1:length(parmvet)
   EEG = nan(n,timelen);
   for i = 1:n
        EEG(i,:) = Brownian_Brigde(timelen,1);
   end
   data_sets{genpars} = EEG*parmvet(genpars);
end
elseif data == 1
    for genpars = 1:length(parmvet)
        EEG = nan(n,timelen);
        EEG(:,1) = 0;
        for i = 1:n
            for j = 2:timelen
                EEG(i,j) = parmvet(genpars)*EEG(i,j-1)+normrnd(0,1);
            end
        end
        data_sets{genpars} = EEG;
    end
end


matdist = zeros(length(parmvet),length(parmvet));
matvars = zeros(length(parmvet),length(parmvet));
statvet = nan(1,m);
for pos1 = 1:length(parmvet)
   for pos2 = pos1+1:length(parmvet)

       proj1 = data_sets{pos1}*browns';
       proj2 = data_sets{pos2}*browns';
       
       for tst = 1:m
           [~,~,stat0] = kstest2(proj1(:,tst),proj2(:,tst));
           statvet(tst) = stat0;
       end
       
       matdist(pos1,pos2) = mean(statvet);
       matvars(pos1,pos2) = var(statvet);
       matdist(pos2,pos1) = matdist(pos1,pos2);
       matvars(pos2,pos1) = matvars(pos1,pos2);
   end
end


lbs = cell(1,length(parmvet));
for la = 1:length(parmvet)
   lbs{la} = ['DATA' num2str(la)]; 
end

if varcorrect == 1
    randvar = max(max(matvars(matvars ~= 0)));
    gamma = findboundber(m,n,randvar,alpha);
    matuse = matdist;
else
    %[gamma, matuse] = multigamma(matdist, matvars,m,n,alpha);
end






if publi_pic == 1
    figure;
    [D] = dendrogram(linkage(squishMat(squeeze(matuse)), 'complet'), 'ColorThreshold', gamma, 'Labels', lbs);
    set(D, 'LineWidth', 2)
end
leafs = cluster(linkage(squishMat(squeeze(matuse)), 'complet'), 'Criterion','distance', 'cutoff', gamma)';

cont = 0;
found = 0;
eq = 0;
coreq = 0;
dif = 0;
cordif = 0;
for hhh = 1:length(parmvet)
   for jjj = hhh+1:length(parmvet)
       if (leafs(hhh) == leafs(jjj)) && (parmvet(hhh) == parmvet(jjj)) || (leafs(hhh) ~= leafs(jjj)) && (parmvet(hhh) ~= parmvet(jjj))
           if (leafs(hhh) == leafs(jjj))
               eq = eq + 1;
               coreq = coreq + 1;
           else
               dif = dif + 1;
               cordif = cordif + 1;
           end
           found = found + 1;
           cont = cont + 1;
       else
           if (parmvet(hhh) == parmvet(jjj))
               eq = eq + 1;
           else
               dif = dif + 1;
           end
           cont = cont + 1;
       end
   end
end
corrden = (cont == found);
e0 = coreq/eq;
e1 = cordif/dif;
