[x y z v]=flow;   %�����λ�ٶȳ�������
p=patch(isosurface(x,y,z,v,-3));     %Ϊ��ֵ��׼������
isonormals(x,y,z,v,p)       %�������¹�һ��
set(p,'FaceColor','red','EdgeColor','none');     %���ñ�����߽����ɫ
daspect([1 1 1])        %���������
view(3)
axis tight; grid on
camlight; lighting phong    %�ӹ���
alpha(.5)      %���ñ����͸����ֵ