%Julie Harrow
%1.020 Problem Set 7
%Problem 3 Nominal Case

clear all

%% Constants

sigma = 5.67*10^(-8);   % J/m^2/sec/K^4         Stefan-Boltzman
rho = 1000;             % kg/m^3                density of water
epsilon = 0.92;                               
Sinc = 240;             %watts/m^2              Incident solar SW

alpha_U = 0.219;        %                       SW absorptivities
alpha_L = 0.094;        %                       SW absorptivities


C_S = 4200*10^6;        % J/m^2/K
C_U = 1040*10^6;        % J/m^2/K
C_L = 2340*10^6;        % J/m^2/K

Qs_lat = 80;            %W/m^2
Qs_sen = 10;            %W/m^2  

%% Equations of Temperature

dt = 0.02 * 365 * 24 * 60 * 60;                 %seconds
totalTime = 1:dt:(100 * 365 * 24 * 60 * 60);    %seconds

T_U(1) = 273;
T_L(1) = 273;
T_S(1) = 273;

for i = 1:length(totalTime)-1
    
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat)) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat)...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat)...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_U, 'k')
hold on
plot(totalTime,T_L, 'b')
hold on
plot(totalTime,T_S, 'g')
title('Temperatures Over 100 Years (Nominal Case)')
xlabel('Time (seconds)')
ylabel('Temperatuer (Kelvin)')

