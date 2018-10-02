function [ result ] = Generate_ST(S0,df,size)%df is the freedom degree
result(1:size)=0;
for i=1:size
    result(i)=S0*exp(trnd(df));
end
end