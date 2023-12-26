function browns = CreateBrown(n, smp,typedir, seeduse)
if seeduse ~= 0
    rng(seeduse)
end
browns = nan(n, smp);
for proj = 1:n
	if typedir == 1
			browns(proj, :) = Brownian_Brigde(smp,1);
    elseif typedir == 2
            browns(proj, :) = Brownian_Brigde(smp,2);
    elseif typedir == 3
            u = rand;
            if u>=0.5
                browns(proj, :) = Brownian_Brigde(smp,2);
            else
                 browns(proj, :) = fliplr(Brownian_Brigde(smp,2));
            end
	end
end

%plot(browns')