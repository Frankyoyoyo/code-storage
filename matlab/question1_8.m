clear
clc

A=1;
fai=1;
omega1=1;
omega2=2;
t=-10:0.01:10;

omegat=[omega1*t;omega2*t];

x=A*sin(omegat+fai);

plot(t,x(1,:),'r',t,x(2,:),'b')