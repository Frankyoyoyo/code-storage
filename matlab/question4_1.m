clear
clc
x=[-1.0,-0.75,-0.50,-0.25,0,0.25,0.50,0.75,1.00];
y=[-0.2209,0.3295,0.8826,1.4392,2.0003,2.5645,3.1334,3.7061,4.2836];
yi=polyfit(x,y,1);

scatter(x,y)
hold on

a=-1:0.05:1;
b=yi(1,1).*a+yi(1,2);
plot(a,b)
