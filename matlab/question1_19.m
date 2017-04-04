clear
clc

syms s t
ezsurf('exp(-s)*cos(t)','exp(-s)*sin(t)','t',[0,8],[0,5*pi])