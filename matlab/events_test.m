function test
opts=odeset('events',@g)     %�����¼�����
y0=[1;0];
[t,y,tfinal]=ode45(@f,[0,Inf],y0,opts);
tfinal;   %����������ʱ��
plot(t,y(:,1),'-',[0,tfinal],[1 0],'o')
axis([-0.1 tfinal+0.1 -0.1 1.1])
% text(1.2,0,['tfinal='num2str(tfinal)])

%-----------------------------------------------------

function ydot=f(t,y)
ydot=[y(2);-1+y(2)^2];
function [gstop,isterminal,direction]=g(t,y)
gstop=y(1);
isterminal=1;
direction=[];
