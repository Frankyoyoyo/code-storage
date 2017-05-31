function question5_4
clc
clear
global g m1 m2 h H k v1 v2
g=9.81;m1=2;m2=1;h=3;H=5;k=1;
opts1=odeset('events',@events1);
opts2=odeset('events',@events2);



[t,y1,tfinal1]=ode45(@f1,[0,10],[H,0],opts1);
collide
[t,y2]=ode45(@f2,[tfinal1,10],[h,v1(2,1)],opts2);
plot(t,y1(:,1))



function freefalling=f1(t,y1)
global g
freefalling=[y1(2);-g];

function vibration=f2(t,y2)
global g m2 k h
vibration=[y2(2);(k*h-m2*g-k*y2(1))/m2]

function [value,isterminal,direction] = events1(t,y1)   %判断第一次接触
global h
value = y1-h;
isterminal = 1;
direction = [];
function [value,isterminal,direction] = events1(t,y1,y2)   %判断第二次接触
global h
value = y1-y2;
isterminal = 1;
direction = [];


function collide
global m1 m2 v1final v1 v2
syms v1 v2
[v1,v2]=solve(m1*v1final-m1*v1-m2*v2,m1*v1final^2-m1*v1^2-m2*v2^2)
