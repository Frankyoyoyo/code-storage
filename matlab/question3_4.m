% a=0.35;   %radius
% 
% %电场线：
% [X,Y,Z]=meshgrid(-0.5:0.04:0.5);
% r2=X.^2+Y.^2+Z.^2;
% for k=1:81
%     phi=pi/40*(k-1);
%     costh=cos(phi);
%     sinth=sin(phi);
%     R3=(r2+a^2-2*a*(X*costh+Y*sinth)).^(3/2);
%     Ex0(:,:,:,k)=a*Z*costh./R3;
%     Ey0(:,:,:,k)=a*Z*sinth./R3;
%     Ez0(:,:,:,k)=a*(a-X*costh-Y*sinth)./R3;
% end
% Ex=pi/40*trapz(Ex0,4)
% Ey=pi/40*trapz(Ey0,4);
% Ez=pi/40*trapz(Ez0,4);          %三个方向的电场强度
% 
% i=2
% Ex(1,1,i)

% 
% v=[-0.2,-0.1,0,0.1,0.2];
% [Vx,Vy,Vz]=meshgrid(v,v,0);
% plot3(Vx(:),Vy(:),Vz(:),'r*')
% streamline(X,Y,Z,Ex,Ey,Ez,Vx,Vy,Vz,[0.01,2000]);
% streamline(X,Y,Z,-Ex,-Ey,-Ez,Vx,Vy,Vz,[0.01,2000]);
% hold on;
% axis([-0.5,0.5,-0.5,0.5,-0.5,0.5]);
% view(-23,26);
% box on;
% t=0:pi/100:2*pi;
% plot(a*exp(i*t),'r-','LineWidth',3);
% 
% %等势面：

%二维电势图
the=0:pi/20:pi;
R=1;
y=-1:0.04:1; 
z=-1:0.04:1;
[Y,Z,T]=meshgrid(y,z,the);
du=R./sqrt((-R*cos(T).^2+(Y-R*sin(T).^2))+Z.^2);
U=pi/2*trapz(du,3);
U=peaks;
contour(peaks)        %用contour画平面等值线
R=peaks;
[c,h]=contourf(R);    %给二维图填涂上颜色
clabel(c,h);
colorbar
