clear
clc

f1=@(z)exp(-z.^2);
x=0

for i=0:10
    x
    f=2/sqrt(pi)*quad(f1,0,x)
    g=erf(x)
    dis=f-g
    
    x=x+0.1;
    i=i+1;
end