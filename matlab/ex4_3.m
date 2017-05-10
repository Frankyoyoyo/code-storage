clear all
x=-0.2:0.1:1;
y=2*x.^5-3*x.^3-x.^2-9;
P=polyfit(x,y,5);
y1=polyval(P,x);
xin=-0.15:0.1:1.05;
y2=interp1(x,y,xin,'pchip');
subplot(1,2,1)
plot(x,y,'black',x,y1,'r*',xin,y2,'b.')
%
yr=2*x.^5-3*x.^3-x.^2-9+0.1*rand(1,13);
Pr=polyfit(x,yr,5);
y1r=polyval(Pr,x);
xin=-0.15:0.1:1.05;
y2r=interp1(x,yr,xin,'pchip');
subplot(1,2,2)
plot(x,y,'black',x,y1r,'r*',xin,y2r,'b.')
