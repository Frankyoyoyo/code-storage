clear
clc

delta = 0.01:-0.001:0.0001
F=@(t,y)y.^2 - y.^3;
for i = 1:length(delta)
opts=odeset('RelTol',1.e-4);
delta(i)
ode45(F,[0 2/delta(i)],delta(i),opts);
end

figure(2)
ode23s(F,[0 2/delta(10)],delta(10),opts);
