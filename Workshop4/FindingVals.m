%numerically solve the ode to create a plot
[t, theta] = ode45(@eom, [0, 7], [pi/2; 0]);

Weird_scaling = 450/650; %This is something I had to do as there were only 2 values to adjust and 3 things to match (period, amplitude, decay rate)

plot(t,theta(:,2)/pi*180*Weird_scaling) %Convert to degrees then plot thetadot and compair this to the gyro 'untitled.fig'

%All the values we used
g = 9.81;
l = 0.11;
m = 0.2;
b = 0.004;
Kt = 0.192;
R = 11.5;
Kb = 0.297;