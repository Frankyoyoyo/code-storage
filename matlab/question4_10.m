clear
clc

syms x y
f=@(x,y)x.^2+25*y.^2-2*x+50*y+25;
z=f(x,y);
diff(z,x)
diff(z,y)

[a,b]=solve('2*x - 2=0','50*y + 50','x','y')
A=diff(z,x,2);
B=diff(diff(z,x),y);
C=diff(z,y,2);
B.^2-A*C

[X,Y]=meshgrid(-6:0.1:6);
Z=X.^2+25*Y.^2-2*X+50*Y+25;
mesh(X,Y,Z)

min=f(1,-1)
