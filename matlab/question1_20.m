clear
clc

%syms t
t=-5:0.1:5;
subplot(1,2,1)
ellipsoid(0,0,1,2,3,4,100)
axis equal

subplot(1,2,2)
r=1+t.^2;
cylinder(r,100)