close all
hold on
syms s;
g = 9.81;
l = 0.11;
m = 0.2;
b = 0.004;
Kt = 0.192;
R = 11.5;
Kb = 0.297;
NUM = [Kt/R];
DEN = [m*l^2 b+Kt*Kb/R -m*g*l];

plant = tf(NUM,DEN);

C_K = tf([0.2 1],[0.0095 1]);

sys = C_K*plant;
rlocus(sys)

K = 1;

[Gm,Pm,Wgm,Wpm] = margin(K*sys);
cl = sys/(1+sys)


bode (cl)