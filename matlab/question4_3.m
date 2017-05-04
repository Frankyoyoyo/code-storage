clear
clc

x=-0.2:0.1:1;
y=2*x.^5-3*x.^3-x.^2-9;

yi1=polyfit(x,y,5);
subplot(1,2,1)
scatter(x,y,'*g');
hold on                     %画点

a=-0.2:0.02:1;
b=yi1(1,1)*a.^5+yi1(1,2)*a.^4+yi1(1,3)*a.^3+yi1(1,4)*a.^2+yi1(1,5)*a+yi1(1,6);
plot(a,b,'b')
hold on                     %多项式拟合

xi=-0.2:0.02:1;
yi2=interp1(x,y,xi,'pchip');
plot(xi,yi2,'r--')          %保形内插法拟合
hold on
axis([-0.5,1,-11,-8.5]);


%-------------------------------------------------
y=y+0.1*rand(1,13);       %加入随机偏差

yi1=polyfit(x,y,5);
subplot(1,2,2)
scatter(x,y,'*g');
hold on                     %画点

a=-0.2:0.02:1;
b=yi1(1,1)*a.^5+yi1(1,2)*a.^4+yi1(1,3)*a.^3+yi1(1,4)*a.^2+yi1(1,5)*a+yi1(1,6);
plot(a,b,'b')
hold on                     %多项式拟合

xi=-0.2:0.02:1;
yi2=interp1(x,y,xi,'pchip');
plot(xi,yi2,'r--')          %保形内插法拟合
hold on
axis([-0.5,1,-11,-8.5]);