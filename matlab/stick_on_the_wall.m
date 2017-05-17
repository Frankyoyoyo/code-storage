function mga     %stage 1
clear
clc

global M w l g
M=5; w=0.00; l=4; g=9.81;   %初速度w
Ic= M*l^2/3;  %对质心的转动惯量
dt=0.001;       tspan=[0:dt:2];
y0=[l*cos(pi/3),0,l*sin(pi/3),0,(2*pi/3),0]; %初始条件
options=odeset('Events',@events); %开启事件判断功能
[T,Y,TE]=ode45(@fy4,tspan,y0,options);

N=length(T)-1;          t=T(2:N);     %解方程中的时间变量
xc=Y(2:N,1);         v_xc=Y(2:N,2);   %质心坐标与速度
yc=Y(2:N,3);         v_yc=Y(2:N,4);
fy=Y(2:N,5);         v_fy=Y(2:N,6);   %转角与速度
xs=xc-v_yc./v_fy;  ys=yc+v_xc./v_fy;  %瞬心坐标

subplot(2,2,1)
plot(xc,yc,'r-',xs,ys,'k-');    %质心轨迹和瞬心轨迹
axis([-0,10,0,10]);
xlabel('x');    ylabel('y');
title('木棍沿墙下滑运动图-前半段');
legend('质心轨迹','瞬心轨迹',1);
hold on

for k=2:200:N;            %木棍的位置
    x_a=xc(k)+l*cos(fy(k));
    x_b=xc(k)-l*cos(fy(k));
    y_a=yc(k)+l*sin(fy(k));
    y_b=0;
    plot([x_a,x_b],[y_a,y_b],xc(k),yc(k),'o');
end
dxs=gradient(xs,dt);    %求瞬心随时间的变化率
dys=gradient(ys,dt);
p=1:200:N;
quiver(xs(p),ys(p),dxs(p),dys(p)); %取部分数据作瞬心变化率的矢量图

subplot(2,2,2);
Is=Ic+M*((xs-xc).^2+(ys-yc).^2);    %转动惯量
plot(t,Is);
axis([0,1.4,105,120]);
xlabel('t');   ylabel('Is');
title('Is随时间变化图-前半段');

subplot(2,2,3);
px=M.*v_xc;   py=M.*v_yc;
dd=(dxs.*py-dys.*px);          %dR/dt * P 项
plot(t,dd);
axis([0,1.4,-60,90]);
xlabel('t');   ylabel('dR/dt     \times   P');
title('dR/dt   \times  P');

subplot(2,2,4);
axis([0,1.4,90,220]);
hold on;
title('方言公式验证图-前半段');
xlabel('t');  ylabel('y');
V=1:70:N;   tt=t(V);    %取部分数据画图
dfr=M*g.*(xs-xc);    dfr=dfr(V);    %外力矩和（右边第一项）
left=dfr-dd(V);           %方言共识的等号右边
dfl=gradient(Is.*v_fy,dt);
right=dfl(V);             %方言公式的等号左边
plot(tt,left,tt,right,'o',tt,dfr,'*')
legend('公式左边','公式右边','外力矩和',2);

TE           %输出木棍脱离墙的时间
y_end=Y(end,:)      %输出终点数据

function f=fy4(t,y)
global M w l g
M=5; w=0.00; l=4; g=9.81;   %初速度w
f=[ y(2);
	-3*g*cos(y(5))*sin(y(5))/4+l*cos(y(5))*y(6)^2;
	y(4);
	-3*g*cos(y(5))^2/4-l*sin(y(5))*y(6)^2;
	y(6);
	-3*g*cos(y(5))/(4*l)];
	
function [value,isterminal,direction]=events(T,Y)
global M w l g
M=5; w=0.00; l=4; g=9.81;   %初速度w
value=l*Y(6).^2-3/4*g*sin(Y(5));
isterminal=1;
direction=0;
