function [thres, returnG] = findboundber(nbr,n,v,alpha)


if (12 < n) && (n < 458)
    C = 2*(1-(0.07/n)+(40/n^2)-(400/n^3));
elseif n>458
    C = 2;
elseif    n <= 12
    C = exp(1);
end


szgrad = 100000;
grid = linspace(0,alpha,szgrad);
%resfun = nan(1,szgrad);
RandG = nan(1,szgrad);
gammav = nan(1,szgrad);
%epsilondelta = nan(1,szgrad);
for i = 1:szgrad
    delta = grid(i);
    epsilon = 7*log(2/delta)/(3*(nbr-1));
    Gamma = sqrt(2*v*log(2/delta)/nbr);
    gamma = sqrt(log(C/alpha-delta)/n)+epsilon;
    if gamma>epsilon
        %resfun(i) = C*exp(-n*(gamma-epsilon)^2)+delta;
        RandG(i) = Gamma;
        gammav(i) = gamma;
        %epsilondelta(i) = epsilon;
    end
end
[thres, posg] = min(gammav+RandG);
returnG = RandG(posg(1));

