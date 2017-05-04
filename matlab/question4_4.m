clear
clc

x=0:0.1:2;
y=[0,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0,0,0,0,0,0,0,0,0,0];

%傅里叶级数拟合见Curve fitting

xi=0:0.02:2;
yi=interp1(x,y,xi,'pchip');
subplot(1,2,1)
plot(xi,yi);          %保形内插法拟合
hold on

axis([0,2,-0.05,0.3])

Y=fft(y);
f=(0:numel(Y)-1)'*100/numel(Y);
subplot(1,2,2)
plot(f,Y)