function question5_4
clear;
clc;

tstart = 0;
tfinal = 30;
tstep = 0.1;
global m_ball m_block k len
m_ball = 2;
m_block = 1;
k = 30;
len = 15;
y0_ball = [25; 0];
y0_block = [len; 0];    %³õÖµ
tout_ball = tstart;
tout_block = tstart;
yout_ball = y0_ball.';
yout_block = y0_block.';

for time = tstart : tstep : (tfinal - tstep)
    [t_ball, y_ball] = ode45(@f_ball, [time time + tstep], y0_ball);
    [t_block, y_block] = ode45(@f_block, [time time + tstep], y0_block);
    
    nt_ball = length(t_ball);
    nt_block = length(t_block);
    
    tout_ball = [tout_ball; t_ball(2:nt_ball)];
    tout_block = [tout_block; t_block(2:nt_block)];
    yout_ball = [yout_ball; y_ball(2:nt_ball, :)];
    yout_block = [yout_block; y_block(2:nt_block, :)];
    
    y0_ball(1) = y_ball(nt_ball, 1);
    y0_block(1) = y_block(nt_block, 1);
    
    if y0_ball(1) <= y0_block(1)
        y0_ball(2) = ((m_ball - m_block) * y_ball(nt_ball, 2) + 2 * m_block * y_block(nt_block, 2)) / (m_ball + m_block);
        y0_block(2) = ((m_block - m_ball) * y_block(nt_block, 2) + 2 * m_ball * y_ball(nt_ball, 2)) / (m_ball + m_block);
    else
        y0_ball(2) = y_ball(nt_ball, 2);
        y0_block(2) = y_block(nt_block, 2);
    end
end
hold on
plot(tout_block, yout_block(:, 1), '-o')
plot(tout_ball, yout_ball(:, 1), '-b')
hold off
end

function ydot = f_ball(t, y)
ydot = [y(2); - 1 + y(2) ^ 2];
end

function ydot = f_block(t, y)
global m_block k len;
ydot = [y(2); - k / m_block * (y(1) - len)];
end