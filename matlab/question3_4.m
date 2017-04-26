clear all;
a=0.35; q=1;
%固定z，平行于xoy平面的等势线
z=1;
x=-1:0.04:1;
y=-1:0.04:1;
phi=0:pi/200:2*pi;
[X,Y,Phi]=meshgrid(x,y,phi);
R=sqrt((X-a*cos(Phi)).^2 + (Y-a*sin(Phi)).^2 + z.^2);
u0=q./(2*pi*R);
u=pi/200*trapz(u0,3);
figure(1)
subplot(1,2,1)
contour(u)

%与yoz平行的平面上的等势线
clear X Y Z x y z
y=-1:0.01:1;
z=-1:0.01:1;
X=0;% you can change the X value
[Y,Z,T]=meshgrid(y,z,phi);
R=sqrt((X-a*cos(T)).^2 + (Y-a*sin(T)).^2 + Z.^2);
u0=q/(2*pi*R);
u=pi/200*trapz(u0,3);
subplot(1,2,2)
contour(y,z,u,[0.5,1,1.5,2,2.5,3,3.5,3.8])

%等势面
clear X Y Z Phi u u0
a=0.35; q=1;
[X,Y,Z]=meshgrid(-1:0.04:1);
for k =1:81
 phi=pi/40*(k-1);
 R=sqrt((X-a*cos(phi)).^2 + (Y-a*sin(phi)).^2 + Z.^2);
 R3 = R.^3;
 u0(:,:,:,k)=q./(2*pi*R);
end
u=pi/40*trapz(u0,4);
figure(2)
p = patch(isosurface(X,Y,Z,u,1.5));
isonormals(X,Y,Z,u,p);
p1 = patch(isosurface(X,Y,Z,u,2));
isonormals(X,Y,Z,u,p1);
p2 = patch(isosurface(X,Y,Z,u,3.8));
isonormals(X,Y,Z,u,p2);
isosurface(X,Y,Z,u,3);
set(p, 'FaceColor', 'yellow', 'EdgeColor', 'none');
set(p1, 'FaceColor', 'red', 'EdgeColor', 'none');
set(p2, 'FaceColor', 'blue', 'EdgeColor', 'none');
daspect([1 1 1]);
view(3)
axis tight;grid on;
camlight;lighting phong
alpha(0.5)