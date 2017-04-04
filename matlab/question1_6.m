clear
clc

format short e

A=[1 2 3;0 5 9;0 0 8]
B=A^-1
C=B*A
D=B.*A
E=sqrt(A)
e=det(E)