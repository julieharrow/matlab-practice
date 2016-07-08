%Julie Harrow
%1.020 PSet 5: Problem 1

%Inputs
h = 30; %cm height of soil column
A = 10; %cm^2 cross sectional area of soil column
Ms = 10; %g initial mass of tracer
t = 120:120:2400; %seconds
c = [0.0000 0.0002 0.0037 0.0112 0.0203 0.0253 0.0295...
    0.0298 0.0292 0.0237 0.0185 0.0167 0.0154 0.0111 0.0099...
    0.0076 0.0064 0.0043 0.0037 0.0027];  %measured concentrations


%Trial and Error Values
V = 5; %velocity (m/s)
D = 6; %dispersion coefficient

%Plot Measurements
plot(t,c,'k*')
