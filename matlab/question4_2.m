clear
clc

x=[-3,-2,0,3,4];
y=[18,10,2,2,5];
yi=polyfit(x,y,2);

scatter(x,y);
hold on

a=-5:0.05:5;
b=yi(1,1).*a.*a+yi(1,2).*a+yi(1,3);
plot(a,b)