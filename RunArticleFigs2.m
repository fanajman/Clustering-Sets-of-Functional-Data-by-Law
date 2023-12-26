function RunArticleFigs2
rng(1)
addpath('/var/tmp/CopyOfData/MATLAB/ClusterByLaw')
numrepet = 100;
ns = 40:20:200;
ms = 10:20:50;
paramvet1 = [1,1,2,2,2,4,4];
paramvet2 = [0.99,0.99,0.66,0.66,0.66,0.33,0.33];






resultsAutoDKW1 = nan(length(ns),length(ms),numrepet);
resultsAutoDKW2 = nan(length(ns),length(ms),numrepet);
resultsAutoDKW3 = nan(length(ns),length(ms),numrepet);
for usen = 1:length(ns)
    for usem = 1:length(ms)
        for repet = 1:numrepet
            [corrden, e0, e1] = ArticleClustBrowBern(paramvet2,ns(usen),ms(usem),1,0);
            resultsAutoDKW1(usen,usem, repet) = corrden;
            resultsAutoDKW2(usen,usem, repet) = e0;
            resultsAutoDKW3(usen,usem, repet) = e1;
            save('simresul_DKW_Auto', 'resultsAutoDKW1', 'resultsAutoDKW2', 'resultsAutoDKW3')
        end
    end
end


