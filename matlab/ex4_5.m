clear
clc

x=1:8;
y=[15.3, 20.5, 27.4, 36.6, 49.1, 65.6, 87.87, 117.6];
y1=log(y);
P=polyfit(x,y1,1);
yout=exp(P(2))*exp(P(1)*x);
plot(x,yout,x,y,'r*')