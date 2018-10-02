data=xlsread('DATASET.xlsx');
data(:,6:7)=data(:,6:7).*100;
data(:,6)=data(:,6).*(-1);
N=length(data);


U_store=0;
iteration=100000;
weights=round(rand(1,N)*0); 
weights_store=weights;
if(portfolio_cost(data,weights)<=100000)
    S_T=Generate_ST(2570,3,100);
    C=C_T(2500,1000,S_T);
    P=portfolio_payoff(data,weights,S_T);
    vector=C-P;
    U=V(2,100000,vector);
    U_store=U;
end 
for i=1:iteration
    weights=round(rand(1,N)*10-5); 
    while(portfolio_cost(data,weights)>100000)
        weights=round(rand(1,N)*10-5);
    end
    S_T=Generate_ST(2570,3,100);
    C=C_T(2500,1000,S_T);
    P=portfolio_payoff(data,weights,S_T);
    vector=C-P;
    U=V(2,100000,vector);
    if(U<=U_store)
        weights_store=weights;
        U_store=U;
    end
end
fprintf('the smallest V:  %f\n',U_store);
fprintf('the optimal weights:\n ');
fprintf(',%d',weights_store);
fprintf('\n');


S_T=0:1:5000;
payoff_result=portfolio_payoff(data,weights_store,S_T);
plot(S_T,payoff_result);































