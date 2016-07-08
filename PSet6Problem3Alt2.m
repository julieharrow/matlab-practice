%Julie Harrow
%1.020 Problem Set 6
%Problem 3 Alternative 2

clear all

%% House Parameters

HeightWall = 4;         %m
HeightRoof = 3;         %m

AreaWindow = 6 * 2;     %m^2 (height 2m, width 1m of six windows)

AreaDoor = 2.5;         %m^2 (height 2.5m, width 1m)

AreaWall = 128 - (6 * AreaWindow) - AreaDoor;     %m^2

AW1 = AreaWall * .15;    %15 percent of window area
AW2 = AreaWall * .85;    %85 percent of window area

AreaRoof = 80;          %m^2
AreaProj = 64;          %m^2
AR1 = AreaRoof * .15;    %15 percent of roof area
AR2 = AreaRoof * .85;    %85 percent of roof area

AreaFloor = 8 * 8;      %m^2
AF1 = AreaFloor * .15;   %15 percent of floor area
AF2 = AreaFloor * .85;   %85 percent of floor area

AreaCeiling = 8 * 8;      %m^2
AC1 = AreaFloor * .15;   %15 percent of ceiling area
AC2 = AreaFloor * .85;   %85 percent of ceiling area

VolumeInterior = (AreaFloor * HeightWall);     %m^3

%%Walls R (m^2 K/W)

Rg = 0.10;              %gypsum      
Rs = 0.20;              %sheathing
Rb = 0.08;              %brick facade

Rw = 0.55;              %wood stud (15%)
Rf = 1.0;               %cavity-fiberglass (85%)

R_W1 = Rg + Rs + Rb + Rw; %15 percent of the time
R_W2 = Rg + Rs + Rb + Rf; %85 percent of the time

%Composite R
R_W = ((AW1 + AW2) * (R_W1 * R_W2)) / ((AW1 * R_W2) + (AW2 * R_W1));

%%Roof R (m^2 K/W)

Rg = 0.10;              %gypsum      
Rp = 0.17;              %plywood sheathing
Ra = 0.08;              %asphalt

Rw = 0.55;              %wood stud (15%)
Rair = 0.18;            %air cavity (18%)

R_R1 = Rg + Rp + Ra + Rw;   %15 percent of the time
R_R2 = Rg + Rp + Ra + Rair; %85 percent of the time

%Composite R
R_R = ((AR1 + AR2) * (R_R1 * R_R2)) / ((AR1 * R_R2) + (AR2 * R_R1));


%%SUBFloor R (m^2 K/W)

Rcarpet = 0.37;         %carpet     
Rconcrete = 0.34;       %poured concrete

Rf = 1.0;               %cavity-fiberglass
Rw = 0.55;              %wood stud

R_F1 = Rcarpet + Rconcrete + Rw;   %15 percent of the time
R_F2 = Rcarpet + Rconcrete + Rf;   %85 percent of the time

%Composite R
R_F = ((AF1 + AF2) * (R_F1 * R_F2)) / ((AF1 * R_F2) + (AF2 * R_F1));


%%Ceiling R (m^2 K/W)

Rg = 0.10;              %gypsum      
Rs = 0.20;              %sheathing

Rf = 1.0;               %cavity-fiberglass
Rw = 0.55;              %wood stud

R_C1 = Rg + Rs  + Rw; %15 percent of the time
R_C2 = Rg + Rs  + Rf; %85 percent of the time

%Composite R
R_C = ((AC1 + AC2) * (R_C1 * R_C2)) / ((AC1 * R_C2) + (AC2 * R_C1));
%%Windows

R_P = 0.40;             %double pane

%%Door

R_D = 0.67;             %wood, hollow core


%% Constants/Inputs

data = dlmread('harvardmet.txt');
t = data(:,1)' * 86400;         %Decimal time in seconds
S = data(:,2)';                 %SW solar radiation in W/m^2
Tair = data(:,3)' + 273;        %Outside temperature in Kelvin
Tsky = data(:,4)' + 273;        %Sky temperature in Kelvin
Tground = data(:,5)' + 273;     %Ground temperature in Kelvin


sigma = 5.7 * 10^(-8);  %Stefan Bolzman Constant (watts/m^2/K^4)

%%Convection Inputs
Hout = 25;              %outdoors [W/m^2K]
Hin = 10;               %indoors [W/m^2K]

%%Heat Capacity Properties
    %specific heat (J/kg/K)
Cv_air = 718;
Cv_wall = 900;
Cv_floor = 880;
Cv_roof = 900;
    %density (kg/m^3)
rho_air = 1.20;
rho_wall = 2400;
rho_floor = 2400;
rho_roof = 2400;
    %thickness (m)
t_wall = 0.2;
t_floor = 0.2;
t_roof = 0.15;

%%Composite Specific Heat Coefficients
Cv_I = ((Cv_wall * rho_wall * AreaWall * t_wall) + ...
    (Cv_air * rho_air * VolumeInterior) + ...
    (Cv_floor * rho_floor * AreaFloor * t_floor));

Cv_R = (rho_roof * AreaRoof * t_roof * Cv_roof);

Cv_C = 1000000;

%(rho_air * (1/3) * AreaFloor * HeightRoof * Cv_air);

%%Radiation Inputs
eSky = 0.8;             %emissivity sky 
eRoof = 0.9;            %emissivity roof
aRoof = 0.6;            %absorptivity roof


%% Equations of Heat Exchange (Q "dot"):


dt = 5400;              %timing increment in seconds

Tint(1) = 291;          %initial interal temperature 18 degrees celcius
Troof(1) = 291;
Tceiling(1) = 291;

furnace = 8000;         %(Watts) Turns on at Tint < 291K at 35x10^6 Joules/L
totalSecondsOn = 0;

for i = 1:length(t)-1
    
    if Tint(i) < 291
        Qfurn = furnace;
        totalSecondsOn = totalSecondsOn + 1;
    else
        Qfurn = 0;
    end
    
    
    Tint(i+1) = (((AreaWall * (Tair(i) - Tint(i)) / (R_W + (1/Hout) + (1/Hin))) + ...
        (AreaWindow * (Tair(i) - Tint(i)) / (R_P + (1/Hout) + (1/Hin))) + ...
        (AreaDoor * (Tair(i) - Tint(i)) / (R_D + (1/Hout) + (1/Hin))) + ...
        (AreaFloor * (Tground(i) - Tint(i)) / R_F) + ...
        (AreaCeiling * (Tceiling(i) - Tint(i)) / (R_C)) + ...
        (Qfurn)) / (Cv_I)) * dt  + Tint(i);
    
    Troof(i+1) = ((((AreaRoof * (Tair(i) - Troof(i)) / (1/Hout)) + ...
        (aRoof * AreaProj * S(i)) + ...
        (eSky * sigma * AreaRoof * Tsky(i)^4) - ...
        (eRoof * sigma * AreaRoof * Troof(i)^4) - ...
        (AreaCeiling * (Troof(i) - Tceiling(i))/ (R_C))) / ...
        Cv_R)* dt) + Troof(i);
    
        
    Tceiling(i+1) = ((((AreaCeiling * (Troof(i) - Tceiling(i)) / (R_C)) - ...
        (AreaCeiling * (Tceiling(i) - Tint(i)) / (R_C))) / Cv_C) * dt) + ...
        Tceiling(i);
 
end

totalEnergy = totalSecondsOn * furnace * dt;

%%Formulas
    
% Qsw = aRoof * AreaProj * S(i); 
% Qsky = eSky * sigma * AreaRoof * Tsky(i)^4;
% Qrc = AreaRoof * (Tair(i) - Troof(i)) / (1/Hout); 
% Qra = eRoof * sigma * AreaRoof * Troof(i)^4; 

% Qic = AreaCeiling * (Tceiling(i) - Tint(i)) / (R_C); 
% Qcr = AreaCeiling * (Troof(i) - Tceiling(i))/ (R_C) 

% Qiw = AreaWall * (Tair(i) - Tint(i)) / (R_W + (1/Hout) + (1/Hin)); 
% Qig = AreaWindow * (Tair(i) - Tint(i)) / (R_P + (1/Hout) + (1/Hin));
% Qid = AreaDoor * (Tair(i) - Tint(i)) / (R_D + (1/Hout) + (1/Hin));
% Qif = AreaFloor * (Tground(i) - Tint(i)) / R_F;

%%Furnace

%Average fuel cost of North Boston, MA
%http://www.newenglandoil.com/massachusetts/zone2.asp?x=0

fuelCost = 2.609 / 3.7854118;   %cost/gal * 1gal/3.7854118liters = cost/L
EnergyContent = 35 * 10^6;      %Joule/L     

C_fuel(1) = fuelCost;

Tboolean = Tint < 291;

for j = (1:length(t)-1)
    C_fuel(j + 1) = ((fuelCost/EnergyContent) * Tboolean(j) * Qfurn * dt) + C_fuel(j);
end

annualCostFuel_upgrade = C_fuel(length(t));


%%Discounting
r = .05;
N = 30;

annualCostFuel_nominal = 1.6732e+03;

deltaC = annualCostFuel_nominal - annualCostFuel_upgrade;

NPV = deltaC * (1 - (1+ r)^(-N)) / r;

%% Graph

plot(t,Tsky,'b');
hold on
plot(t,Troof,'r');
hold on
plot(t,Tair,'m');
hold on
plot(t,Tceiling,'g')
hold on
plot(t,Tground, 'y')
hold on
plot(t,Tint,'k');
xlabel ('Time (seconds)')
ylabel ('Temperature (K)')
title ('Temperatures of House Over One Year')
