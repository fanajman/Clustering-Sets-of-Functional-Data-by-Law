function B=Brownian_Brigde(N,cas)
% rng(1) %% Fixa um Browniano
% N=10000;
%% Brownian Motion
W=zeros(1,N);
for i=2:N
    W(i)=W(i-1)+sqrt(1/(N-1))*normrnd(0,1);
end
if cas == 1
    %% Brownian Bridge
    B=zeros(1,N);
    for i=2:N
        B(i)=W(i)-(1/(N-1))*(i-1)*W(N);
    end
elseif cas == 2
    B = W;
end

 %% Plotting the MB and the BB
% Time=0:1/(N-1):1;
% plot(Time,W, 'k');
%     hold on
% plot(Time,B, 'r');
% hold off