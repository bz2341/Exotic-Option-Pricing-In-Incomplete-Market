function [ result ] = portfolio_cost( dataMatrix,weights )%weights is also a vector
%weights�ĳ���һ����Matrixһ��������N
N=length(dataMatrix);
result=0;
for i=1:N
    if(weights(i)<0)
        result=result+weights(i).*dataMatrix(i,2);
    else
        result=result+weights(i).*dataMatrix(i,3);
    end 
end
end

