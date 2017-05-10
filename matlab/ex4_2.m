clear all
x=[-3 -2 0 3 4]
y=[18 10 2 2 5]
P=polyfit(x,y,2)
y1=polyval(P,x)
plot(x,y1,x,y,'r*')
G=[num2str(P(1)),'*x^2',num2str(P(2)),'*x+',num2str(P(3))];
title(G)
gtext(G)
hold on
x2=-3:0.2:4; y2=P(1)*x2.^2+P(2)*x2+P(3);
plot(x2,y2)