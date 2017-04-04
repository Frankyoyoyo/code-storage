clear
clc

A=magic(3)

%1:取上三角部分a和下三角部分b
a=triu(A)
b=tril(A)

%2:各列元素和c，各行元素和d，各列中值e
c=[sum(A(:,1)),sum(A(:,2)),sum(A(:,3))]
d=[sum(A(1,:));sum(A(2,:));sum(A(3,:))]
e=[median(A(1,:)),median(A(2,:)),median(A(3,:))]

%3:求对角矩阵f和转置矩阵g
f=diag(A)
g=A'

%4:左右翻转得到h 上下翻转得到i 旋转90度得到j
h=fliplr(A)
i=flipud(A)
j=rot90(A)     %左旋

%5:升序排列得到k
k=sort(A)    %各列升序
k_1=sort(A,2)  %各行升序

%6