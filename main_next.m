
%最后一题
S_T=Generate_ST(2570,3,100);
C_benchmark(1:length(S_T))=0;
P=portfolio_payoff(data,weights_store,S_T);
vector_benchmark=C_benchmark-P;
U_benchmark=V(2,100000,vector_benchmark);

price_buy=0:2:1000;
strikeForBuy=[2300,2400,2500,2600,2700,2800];
buy(1:6)=0;
for kkk=1:6 
picked=-100000;
for q=1:length(price_buy) 
    U_store=0;
    iteration=5000;
    weights=round(rand(1,N)*0); 
    weights_store=weights;
    if(portfolio_cost(data,weights)<=100000-price_buy(q))
        S_T=Generate_ST(2570,3,100);
        C=C_T(strikeForBuy(kkk),-1000,S_T);
        P=portfolio_payoff(data,weights,S_T);
        vector=C-P;
        U=V(2,100000-price_buy(q),vector);
        U_store=U;
    end 
    for i=1:iteration
        weights=round(rand(1,N)*10-5); 
        while(portfolio_cost(data,weights)>100000-price_buy(q))
            weights=round(rand(1,N)*10-5);
        end
        S_T=Generate_ST(2570,3,100);
        C=C_T(strikeForBuy(kkk),-1000,S_T);
        P=portfolio_payoff(data,weights,S_T);
        vector=C-P;
        U=V(2,100000-price_buy(q),vector);
        if(U<=U_store)
            U_store=U;
        end
    end
    if(U_store<=U_benchmark)
        picked=[picked,price_buy(q)];
    end
end
buy(kkk)=max(picked);
end
plot(buy,strikeForBuy);

