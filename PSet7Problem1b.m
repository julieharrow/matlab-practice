%Julie Harrow
%1.020 Problem Set 7
%Problem 1b

clear all


Cv = 0.716;
Cp = 1.0;
Vwind = 0.5;
rho_air = 1100;
Vol = 300;
A = 1;
Tair = 20;
T(1) = 30;


dt = 1; %second
t = 1:1000;

for i = 1:length(t)-1
    T(i+1) = (((Vwind * A * Cp * Tair) - ...
        (Vwind * A * Cp * T(i)))/(Vol * Cv)) * dt + T(i);
end

plot(t,T)
title('Room Temperature')
xlabel('time (seconds)')
ylabel('temperature (degree C)')
text(600,28,'21 degrees C at 989 seconds')