function [ result ] = C_T( K_c,CC,S_T )%S_T����������
N=length(S_T);
result(1:N)=0;
for i=1:N
    if(S_T(i)>K_c)
        result(i)=CC;
    else
        result(i)=0;
    end
end
end

