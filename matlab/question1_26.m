clear
clc

R=3;
lamda=500e-9;
I0=1;

x=-0.003:0.00001:0.003;
y=-0.003:0.00001:0.003;

[x y]=meshgrid(x,y);

delta=2*pi/lamda*2*(R-sqrt(R^2-(x.^2+y.^2)))+pi/2;
I=I0+I0+2*I0*cos(delta);

mesh(x,y,I)