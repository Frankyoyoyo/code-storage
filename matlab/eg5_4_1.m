function tes
clear
clc
global m d e
m=1; b=[0,0.2,0.2]; p=[0,0,1];
px1=[4.8; 3.8; 3.1];
py1=[-6; -25; -44];
px2=[4.6; 4.5; 4.5];
py2=[3.5; 1.8; 0.4];
strdd{1}='无阻尼';
strdd{2}='阻力正比于速度';
strdd{3}='阻力正比于速度平方';
figure(1)
for i=1:3
d=b(i); e=p(i);
[t,y]=ode45(@znxpfun,[0:0.01:10],[0,3,0,0]);
H{i}=max(y(:,3))
maxid=find(y(:,3)==H{i})
T{i}=t(maxid)
vx0{i}=y(maxid,2)
subplot(2,1,1)
axis([0 10 -60 10]);
hold on
xlabel('x'); ylabel('y');
text(px1(i),py1(i),strdd(i));
comet(y(:,1),y(:,3));
plot(y(:,1),y(:,3));
hold on

subplot(2,1,2)
axis([0 10 0 4]), hold on
xlabel('t'),ylabel('dx/dt')
text(px2(i),py2(i),strdd(i));
comet(t,y(:,2))
plot(t,y(:,2))
hold on
end

function ydot=znxpfun(t,y)
global m d e
   ydot = [y(2);
           -d/m*y(2)*(y(2).^2+y(4).^2)^(e/2);
           y(4);
           -9.8-d/m*y(4)*(y(2).^2+y(4).^2)^(e/2)];
