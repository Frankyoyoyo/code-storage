clear
clc

x=-1:0.02:4;
f=@(x)x.^4-4*x.^3-6*x.^2-16*x+4;
fzero(f,[-1,4])         %零点

y=f(x);
plot(x,y)
fminbnd(f,-1,4);
A=[ans,f(ans)]         %极小值对应的点