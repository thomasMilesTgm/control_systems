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

w_c = 1;
m_f = 60*pi/180;

Kcr = 13;
Tcr = 0.00005;

K = 0.6*Kcr;

T1 = 0.5*Tcr;
Td = 0.125*Tcr;
T2 = 0.0001;


k = 10.5;
me = 1*tf([1 5], [0.001 1 100])
pid = k*tf([1.252, 38.58, 100],[0.003 1 0]);
plant = tf(NUM,DEN);
ol = pid*plant;

impulse (me*plant/(1+me*plant))

figure
bode(me*plant)

title("me plant")

K = 50;
% LEAD2 CONTROLLER
z = 0.2;
p = 0.001;

lead = tf([z 1], [p 1])

figure
rlocus(lead)

figure
bode(lead)
title("lead controll")


% repeat the pole to allow a gain margin to exist.
p2 = 0.1;
repeat = tf(1, [p2 1]);



sys = lead*plant
figure
bode(K*sys/(1+K*sys))
title("closedloop")

figure
rlocus(sys)

[Gm,Pm,Wgm,Wpm] = margin(K*sys);

phase_m = Pm
gain_m = Gm

figure
step(K*sys/(1+K*sys))