clear
clc

t=0:pi/20:4*pi;
x=0:0.1*pi:4*pi;
m=moviein(40);
for i=1:40
    y1=sin(x-t(i));
    y2=sin(x+t(i));
    y=y1+y2;
    plot(x,y1,x,y2,x,y);
    axis([0,12,-3,3]);
    m(:,i)=getframe;
end
movie(m,10,60)