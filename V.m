function [ result ] = V( lamda,w,vector )%vector ������һ����������ȻҲ������һ��ֵ����
E=mean(exp(vector.*(lamda/w)));
result=log(E);
end