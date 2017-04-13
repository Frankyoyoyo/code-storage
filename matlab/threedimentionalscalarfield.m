[x y z v]=flow;   %获得三位速度场的数据
p=patch(isosurface(x,y,z,v,-3));     %为等值面准备光照
isonormals(x,y,z,v,p)       %数据重新归一化
set(p,'FaceColor','red','EdgeColor','none');     %设置表面与边界的颜色
daspect([1 1 1])        %坐标轴比例
view(3)
axis tight; grid on
camlight; lighting phong    %加光照
alpha(.5)      %设置表面的透明度值