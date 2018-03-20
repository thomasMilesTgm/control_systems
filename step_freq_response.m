function [  ] = step_freq_response()
% Generates step and frequency responce graphs of a given system
% generate array of systems with varying values of p1 and p1
syms p1 p2;
sys = {};
n = 3;                  % set number of graphs to generate here
r1_low = 0;             % set range of interest for each param here
r1_high = 1;
r2_low = 1;
r2_high = 100;

r1 = r1_low : (r1_high - r1_low)/n : r1_high;   
r2 = r1_low : (r2_high - r2_low)/n : r2_high;

for i = 1:3
    for j = 1:3
        p1=r1(i);
        p2=r2(j);
        
        NUM = [-p1 1];     % Set NUM and DEN to define the system
        DEN = [1 2 1];
        
        sys{i,j} = tf(NUM,DEN);
    end
end



figure('Name','p2 variaion: frequency response', 'NumberTitle', 'off');

% hold p1 constant and vary p2

    figure(1);
    bode(sys{1,:});
    hold all;

figure('Name','p1 variaion: frequency response', 'NumberTitle', 'off');


% hold p2 constant and vary p1

figure(2);
bode(sys{:,1});
hold all;


figure('Name','p2 variaion: step response', 'NumberTitle', 'off');

% hold p1 constant and vary p2
figure(3);
step(sys{1,:});
%axis([0,2,0,2]);
hold all;

figure('Name','p1 variaion: step responce', 'NumberTitle', 'off');


% hold p2 constant and vary p1

figure(4);
step(sys{:,1});
%axis([0,20,0,2]);

hold all;
