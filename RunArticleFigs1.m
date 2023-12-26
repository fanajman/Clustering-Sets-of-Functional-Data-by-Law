function RunArticleFigs1
rng(1)
%addpath('/var/tmp/CopyOfData/MATLAB/ClusterByLaw')
numrepet = 100;
ns = 40:20:200;
ms = 10:20:50;
paramvet1 = [1,1,2,2,2,4,4];
paramvet2 = [0.99,0.99,0.66,0.66,0.66,0.33,0.33];





resultsBrownDKW1 = nan(length(ns),length(ms),numrepet);
resultsBrownDKW2 = nan(length(ns),length(ms),numrepet);
resultsBrownDKW3 = nan(length(ns),length(ms),numrepet);
for usen = 1:length(ns)
    for usem = 1:length(ms)
        for repet = 1:numrepet
            [corrden, e0, e1] = ArticleClustBrowBern(paramvet1,ns(usen),ms(usem),0,0,1);
            resultsBrownDKW1(usen,usem, repet) = corrden;
            resultsBrownDKW2(usen,usem, repet) = e0;
            resultsBrownDKW3(usen,usem, repet) = e1;
            save('simresul_DKW_Brown', 'resultsBrownDKW1', 'resultsBrownDKW2', 'resultsBrownDKW3')
        end
    end
end


