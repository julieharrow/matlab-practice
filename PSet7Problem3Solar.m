%Julie Harrow
%1.020 Problem Set 7
%Problem 3 Variable Solar Forcing

clear all

%% Constants

sigma = 5.67*10^(-8);   % J/m^2/sec/K^4         Stefan-Boltzman
rho = 1000;             % kg/m^3                density of water
epsilon = 0.92;                               

alpha_U = 0.219;        %                       SW absorptivities
alpha_L = 0.094;        %                       SW absorptivities


C_S = 4200*10^6;        % J/m^2/K
C_U = 1040*10^6;        % J/m^2/K
C_L = 2340*10^6;        % J/m^2/K

Qs_lat = 80;            %W/m^2
Qs_sen = 10;            %W/m^2  

Sinc = dlmread('globalsolar.txt')'; %watts/m^2  Incident solar SW

%% Equations of Temperature

dt = 0.02 * 365 * 24 * 60 * 60;                 %seconds
totalTime = 1:dt:(200 * 365 * 24 * 60 * 60);    %seconds

T_U(1) = 273;
T_L(1) = 273;
T_S(1) = 273;

for i = 1:length(totalTime)-1
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc(i))...
        + (0.5 * Qs_lat)) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc(i))...
        + (0.5 * Qs_lat)...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc(i))...
        - (Qs_lat)...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_U, 'r')
hold on
plot(totalTime,T_L, 'b')
hold on
plot(totalTime,T_S, 'k')
title('Temperatures Over 200 Years (Variable Solar Forcing)')
xlabel('Time (seconds)')
ylabel('Temperatuer (Kelvin)')
legend('T_U','T_L','T_S')



