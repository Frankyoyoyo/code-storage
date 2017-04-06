clear
clc

vp=1578;
% syms v;

f=@(v)4/sqrt(pi)*(v.^2/vp^3).*exp(-v.^2/vp^2);

quad(f,0,vp)
quad(f,0,3.3*vp)
quad(f,3e4,3e8)