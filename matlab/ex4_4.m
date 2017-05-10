cc
x=0:0.1:2;
y=[0,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0,0,0,0,0,0,0,0,0,0];
cftool
p=fft(y); % is complex 
ppy=p.*conj(p);
subplot(1,3,1)
plot(x,ppy)
% inverse fft of y
ip=ifft(y);
ippy=ip.*conj(ip)
subplot(1,3,2)
plot(x,ippy)
%inverse fft of p
iip=ifft(p);
iippy=iip.*conj(iip)
subplot(1,3,3)
plot(x,iippy)
