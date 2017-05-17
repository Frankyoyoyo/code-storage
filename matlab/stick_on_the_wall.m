function mga     %stage 1
clear
clc

global M w l g
M=5; w=0.00; l=4; g=9.81;   %���ٶ�w
Ic= M*l^2/3;  %�����ĵ�ת������
dt=0.001;       tspan=[0:dt:2];
y0=[l*cos(pi/3),0,l*sin(pi/3),0,(2*pi/3),0]; %��ʼ����
options=odeset('Events',@events); %�����¼��жϹ���
[T,Y,TE]=ode45(@fy4,tspan,y0,options);

N=length(T)-1;          t=T(2:N);     %�ⷽ���е�ʱ�����
xc=Y(2:N,1);         v_xc=Y(2:N,2);   %�����������ٶ�
yc=Y(2:N,3);         v_yc=Y(2:N,4);
fy=Y(2:N,5);         v_fy=Y(2:N,6);   %ת�����ٶ�
xs=xc-v_yc./v_fy;  ys=yc+v_xc./v_fy;  %˲������

subplot(2,2,1)
plot(xc,yc,'r-',xs,ys,'k-');    %���Ĺ켣��˲�Ĺ켣
axis([-0,10,0,10]);
xlabel('x');    ylabel('y');
title('ľ����ǽ�»��˶�ͼ-ǰ���');
legend('���Ĺ켣','˲�Ĺ켣',1);
hold on

for k=2:200:N;            %ľ����λ��
    x_a=xc(k)+l*cos(fy(k));
    x_b=xc(k)-l*cos(fy(k));
    y_a=yc(k)+l*sin(fy(k));
    y_b=0;
    plot([x_a,x_b],[y_a,y_b],xc(k),yc(k),'o');
end
dxs=gradient(xs,dt);    %��˲����ʱ��ı仯��
dys=gradient(ys,dt);
p=1:200:N;
quiver(xs(p),ys(p),dxs(p),dys(p)); %ȡ����������˲�ı仯�ʵ�ʸ��ͼ

subplot(2,2,2);
Is=Ic+M*((xs-xc).^2+(ys-yc).^2);    %ת������
plot(t,Is);
axis([0,1.4,105,120]);
xlabel('t');   ylabel('Is');
title('Is��ʱ��仯ͼ-ǰ���');

subplot(2,2,3);
px=M.*v_xc;   py=M.*v_yc;
dd=(dxs.*py-dys.*px);          %dR/dt * P ��
plot(t,dd);
axis([0,1.4,-60,90]);
xlabel('t');   ylabel('dR/dt     \times   P');
title('dR/dt   \times  P');

subplot(2,2,4);
axis([0,1.4,90,220]);
hold on;
title('���Թ�ʽ��֤ͼ-ǰ���');
xlabel('t');  ylabel('y');
V=1:70:N;   tt=t(V);    %ȡ�������ݻ�ͼ
dfr=M*g.*(xs-xc);    dfr=dfr(V);    %�����غͣ��ұߵ�һ�
left=dfr-dd(V);           %���Թ�ʶ�ĵȺ��ұ�
dfl=gradient(Is.*v_fy,dt);
right=dfl(V);             %���Թ�ʽ�ĵȺ����
plot(tt,left,tt,right,'o',tt,dfr,'*')
legend('��ʽ���','��ʽ�ұ�','�����غ�',2);

TE           %���ľ������ǽ��ʱ��
y_end=Y(end,:)      %����յ�����

function f=fy4(t,y)
global M w l g
M=5; w=0.00; l=4; g=9.81;   %���ٶ�w
f=[ y(2);
	-3*g*cos(y(5))*sin(y(5))/4+l*cos(y(5))*y(6)^2;
	y(4);
	-3*g*cos(y(5))^2/4-l*sin(y(5))*y(6)^2;
	y(6);
	-3*g*cos(y(5))/(4*l)];
	
function [value,isterminal,direction]=events(T,Y)
global M w l g
M=5; w=0.00; l=4; g=9.81;   %���ٶ�w
value=l*Y(6).^2-3/4*g*sin(Y(5));
isterminal=1;
direction=0;
