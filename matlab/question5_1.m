function question5_1
clear
clc
global G M
G=1;M=5000;r0=100;


%改变能量
E=[-18,0,22];
v0=sqrt(2*E+2*G*M/r0);
energy{1}='E<0';energy{2}='E=0';energy{3}='E>0';

subplot(1,2,1)
for k=1:3
    [t,u]=ode45(@guidao,[0:0.05:100],[r0,0,0,v0(k)/r0]);
    [x,y]=pol2cart(u(:,3),u(:,1));    %坐标系转换
    X=[flipud(x);x];Y=[-flipud(y);y];
    text(-300,-100-(k-1)*300,energy{k});
%     axis equal
%     sun=line(0,0,'color','r','marker','.','markersize',20);
%     comet(X,Y);
    plot(X,Y)
    hold on
end
hold on
sun=line(0,0,'color','r','marker','.','markersize',20);
title('different E');
xlabel('x');ylabel('y');
axis equal

%------------------------------------
%改变角动量(总能量为负，改变初始半径)
E=-10;
r0=[100,200,320];
v0=sqrt(2*E+2*G*M./r0);
radius{1}='100';radius{2}='200';radius{3}='300';

subplot(1,2,2)
for k=1:3
    [t,u]=ode45(@guidao,[0:0.05:180],[r0(k),0,0,v0(k)/r0(k)]);
    [x,y]=pol2cart(u(:,3),u(:,1));
    X=[flipud(x);x];Y=[-flipud(y);y];
    text(-300+(k-1)*200,-300,radius{k});
%     axis equal
%     sun=line(0,0,'color','r','marker','.','markersize',20);
%     comet(X,Y);
    plot(X,Y)
    hold on
end
hold on
sun=line(0,0,'color','r','marker','.','markersize',20);
title('different L');
xlabel('x');ylabel('y');
axis equal

function ydot=guidao(t,y)
global G M
ydot=[y(2);
      y(1)*y(4)^2-G*M/(y(1)^2);
      y(4);
      -2*y(2)*y(4)/y(1)];