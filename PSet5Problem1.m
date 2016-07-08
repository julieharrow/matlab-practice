%Julie Harrow
%1.020 PSet 5: Problem 1

%Inputs
Xs = 30; %cm height of soil column
A = 10; %cm^2 cross sectional area of soil column
Ms = 10; %g initial mass of tracer
t = 120:120:2400; %seconds
conc = [0.0000 0.0002 0.0037 0.0112 0.0203 0.0253 0.0295...
    0.0298 0.0292 0.0237 0.0185 0.0167 0.0154 0.0111 0.0099...
    0.0076 0.0064 0.0043 0.0037 0.0027];  %measured concentrations

%Trial and Error Values
V = .03; %velocity (m/s)
D = .09; %dispersion coefficient
x_average =  V.*t;

Sx = 2*D.*t;
C = zeros(1,length(t));

for i = 1:length(t)
    exponentialTerm = -((Xs - x_average(i))^2)/(2*Sx(i));
    C(i) = (Ms/A)/(sqrt(2*pi*Sx(i)))* exp(exponentialTerm);
end

%Plot Measurements
figure
plot(t,conc,'k*')
hold on
plot(t,C,'k')
title('Concentration Time History')
xlabel('Time (sec)')
ylabel('Concentration (g / cm^3)')
text(1600,.02,'Velocity:  0.03 m/s')
text(1600,.018,'Dispersion Coefficient:  0.09')