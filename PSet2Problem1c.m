
% Julie Harrow
% 1.020 PSet2 Problem 1c
% Plot Ctce vs Time

clear all

%Inputs
Snapl = 1.1; % g/L
knapl = 0.0002; % day^-1
ktce = 0.0025; % day^-1
V = 10000; % L
q = 1; % L/day
tau = V/q; % day

%Coefficients
a = -(ktce + (1/tau) + knapl);
b = -(knapl*Snapl);

%Time 
t = 0:1:1000;

%Formula
Ctce = (b/a)*(1-exp(a*t));

figure
plot(t,Ctce), title('Concentration of TCE vs. Time');
xlabel('time (days)'), ylabel('C TCE (g/L)');
