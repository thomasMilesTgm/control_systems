function [ Xd ] = eom( t, X )

g = 9.81;   %Grav
L = 0.11;   %Length of rod
m = 0.2;    %mass of rod
b = 0.004;  %motor characteristic

%Here the 3 values we are trying to find collapse to just 2 meaning that
%the ratio between b and m is important but not the actual values
K1 = b/(m*L^2);
K2 = g/L;

Xd =  [0; 0]; %Just initialising

Xd(1) = X(2);
Xd(2) = -K1*X(2)+K2*sin(X(1)); %This is the equation from the sheet with sin subbed as small angle was not appropriate

end

