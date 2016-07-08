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


%For loop

for i = 1:length(t)
    Ctce(i) = (b/a)*(exp(a*t(i))-1);
end

plot(t,Ctce),title('Using for loop');

%Incremental Form Solution
dt = 1;

%Initial condition
iCtce = zeros(1,length(t));
iCtce(1) = 0;

for i = 2:length(t)
    iCtce(i) = Ctce(i-1) + (a*Ctce(i-1) + b)*dt;
end

figure
plot(t, iCtce);
    
% COMMENT
% use ; to suppress output
% use 'clear' to earase var from workspace
% use 'close' to close figure
% use 'clc' to clear code
% use 'clf' to 

%Summation Example
sum = 0;

for n = 1:100
    sum = sum + (1/(n^2));
end

approx = (pi^2)/sum;


%Phase Plot
t = 1:100;

a = 2;
b = 5;

y = exp(-a*t).*sin(b*t);

ydot = b*exp(-a*t).*cos(b*t) - a*exp(-a*t).*sin(b*t);

plot(ydot,y), title('Phase Plot'), xlabel('dY/dt'), ylabel('Y');





    