%Julie Harrow
%1.020 Problem Set 7
%Problem 3 Feedbacks and CO2 Increase

clear all

%% Constants

sigma = 5.67*10^(-8);   % J/m^2/sec/K^4         Stefan-Boltzman
rho = 1000;             % kg/m^3                density of water
epsilon_nom = 0.92;                               
Sinc = 240;             %watts/m^2              Incident solar SW

alpha_U = 0.219;        %                       SW absorptivities
alpha_L = 0.094;        %                       SW absorptivities


C_S = 4200*10^6;        % J/m^2/K
C_U = 1040*10^6;        % J/m^2/K
C_L = 2340*10^6;        % J/m^2/K

Qs_latnom = 80;            %W/m^2
Qs_sen = 10;            %W/m^2  


%% Inputs for Equations of Temperature

dt = 0.02 * 365 * 24 * 60 * 60;                 %seconds
totalTime = (1 * 365 * 24 * 60 * 60):dt:(150 * 365 * 24 * 60 * 60);    %seconds

T_U(1) = 251.196;
T_L(1) = 280.481;
T_S(1) = 290.283;

%% Modifcation Variables

T_Snom = T_S(1);
beta = 0.005;
phi = 0.018;
lamda = 1.0;
Cnom = 275;

%% Equations of Temperature

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(totalTime(i)-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

% Plot
plot(totalTime,T_S, 'k')
hold on
title('T_S From 1990 to 2050 (Feedback Case)')
xlabel('Time (seconds)')
ylabel('Temperature (Kelvin)')


%% beta +

beta = 0.0075;
phi = 0.018;
lamda = 1.0;

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'r')
hold on


%% lamda +

beta = 0.005;
phi = 0.018;
lamda = 1.5;

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'y')
hold on

%% phi + 

beta = 0.005;
phi = 100.18;
lamda = 1.0;


for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'g')
hold on

%% beta +, lamda +

beta = 0.0075;
phi = 0.018;
lamda = 1.5;

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'b')
hold on

%% beta +, phi +

beta = 0.0075;
phi = 100.18;
lamda = 1.0;

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'c')
hold on

%% lamda +, phi +

beta = 0.005;
phi = 100.18;
lamda = 1.5;

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'm')
hold on


%% beta +, lamda +, phi +

beta = 0.0075;
phi = 100.18;
lamda = 1.50;

for i = 1:length(totalTime)-1
    
    C(i) = Cnom + (Cnom*(i-(1*365*24*3600))/(150*365*24*3600));
    
    epsilon = epsilon_nom + beta*(T_S(i) - T_Snom) + phi * log(C(i)/Cnom);
    
    Qs_lat(i) = Qs_latnom + lamda*(T_S(i) - T_Snom);
    
    T_U(i+1) = T_U(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (2 * epsilon * sigma * T_U(i)^4)...
        + (alpha_U * Sinc)...
        + (0.5 * Qs_lat(i))) / C_U));
    
    T_L(i+1) = T_L(i) + (dt *...
        (((epsilon * sigma * T_U(i)^4)...
        - (2 * epsilon * sigma * T_L(i)^4)...
        + (epsilon * sigma * T_S(i)^4)...
        + (alpha_L * (1-alpha_U) * Sinc)...
        + (0.5 * Qs_lat(i))...
        + (Qs_sen)) / C_L));
    
    T_S(i+1) = T_S(i) + (dt *...
        (((epsilon * sigma * T_L(i)^4)...
        - (sigma * T_S(i)^4)...
        + ((1-alpha_U-alpha_L+(alpha_U*alpha_L)) * Sinc)...
        - (Qs_lat(i))...
        - (Qs_sen)) / C_S));
    
end

plot(totalTime,T_S, 'k--')

legend('Normal Case', 'Beta Altered', 'Lamda Altered',...
    'Phi Altered', 'Beta and Lamda Altered', 'Lamda and Phi Altered',...
    'Beta and Phi Altered', 'All Variables Altered')