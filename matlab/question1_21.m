clear
clc

x=-5:0.05:5;
y=0:0.05:10;
[x y]=meshgrid(x,y);
z=(x.^2).*y+sqrt(y)./x;

mesh(x,y,z)