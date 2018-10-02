function [ result ] = portfolio_payoff( dataMatrix,weights,S_T )%这里的S_T也可以是向量
M=length(S_T);
N=length(dataMatrix);
result(1:M)=0;
for j=1:M
    for i=1:N
        if(dataMatrix(i,4)==1)
            result(j)=result(j)+weights(i).*max(0,dataMatrix(i,1)-S_T(j));
        else
            result(j)=result(j)+weights(i).*max(0,S_T(j)-dataMatrix(i,1));
        end  

    end 
end
end

