function [ result ] = V( lamda,w,vector )%vector 可以是一个向量，当然也可以是一个值而已
E=mean(exp(vector.*(lamda/w)));
result=log(E);
end