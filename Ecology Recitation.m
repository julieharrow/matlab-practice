% Recitation 2
% Julie Harrow
% Plot t vs. Ctce

clear all

%Inputs
Snapl = 1.1; % g/L
knapl = 0.0002; % day^-1
ktce = 0.0025; % day^-1
V = 10000; % L
q = 1; % L/day
tau = V/q; % day

%Coefficients
a = -(ktce + (1/tau));
b = (1/tau)*Snapl;

%Time 
t = 0:1:1000;

%Formula
Ctce = (b/a)*(exp(a*t)-1);

figure
subplot(2,1,1), plot(t,Ctce), title('Using vector of Time');

