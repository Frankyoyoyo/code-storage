clear
clc

A=magic(3)

%1:ȡ�����ǲ���a�������ǲ���b
a=triu(A)
b=tril(A)

%2:����Ԫ�غ�c������Ԫ�غ�d��������ֵe
c=[sum(A(:,1)),sum(A(:,2)),sum(A(:,3))]
d=[sum(A(1,:));sum(A(2,:));sum(A(3,:))]
e=[median(A(1,:)),median(A(2,:)),median(A(3,:))]

%3:��ԽǾ���f��ת�þ���g
f=diag(A)
g=A'

%4:���ҷ�ת�õ�h ���·�ת�õ�i ��ת90�ȵõ�j
h=fliplr(A)
i=flipud(A)
j=rot90(A)     %����

%5:�������еõ�k
k=sort(A)    %��������
k_1=sort(A,2)  %��������

%6