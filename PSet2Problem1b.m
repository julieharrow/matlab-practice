
% Julie Harrow
% 1.020 PSet2 Problem 1b
% Plot Mnapl vs. Time

clear all

%Inputs
Snapl = 1.1; % g/L
knapl = 0.0002; % day^-1
ktce = 0.0025; % day^-1
V = 10000; % L
q = 1; % L/day
tau = V/q; % day

%Coefficients
a = (knapl^2 * V * Snapl)/(ktce + (q/V) + knapl) - (knapl * V * Snapl);
b = ((knapl^2 * V * Snapl)/(ktce + (q/V) + knapl)^2); 

%Time 
t = 0:1:1000;

%Formula 
Mnapl = a*t + (b * exp(-(ktce + (q/V) + knapl)*t)) + 2572;

figure
plot(t,Mnapl), title('Mass of NAPL vs. Time');
xlabel('time (days)'), ylabel('Mass NAPL (grams)');
axis([0 1000 0 3000])


