clear
clc

format long e

y=@(x)x.^2+sin(x)+log(x);

for i=0:99
    i=i+1
    y(i)
end