%Julie Harrow
%1.020 Problem Set 6
%Problem 3 Alternative 1

%dmlread(harvardmet.txt)

%% House Parameters

HeightWall = 4;         %m
AreaWall = 128;         %m^2
AW1 = AreaWall * .15;    %15 percent of window area
AW2 = AreaWall * .85;    %85 percent of window area

AreaWindow = 2;         %m^2 (height 2m, width 1m)

AreaDoor = 2.5;         %m^2 (height 2.5m, width 1m)

AreaRoof = 80;          %m^2
AR1 = AreaRoof * .15;    %15 percent of roof area
AR2 = AreaRoof * .85;    %85 percent of roof area

AreaFloor = 8 * 8;      %m^2
AF1 = AreaFloor * .15;   %15 percent of floor area
AF2 = AreaFloor * .85;   %85 percent of floor area

%%Walls R (m^2 K/W)

Rg = 0.10;              %gypsum      
Rs = 0.20;              %sheathing
Rb = 0.08;              %brick facade

Rf = 1.0;               %cavity-fiberglass
Rw = 0.55;              %wood stud

R_W1 = Rg + Rs + Rb + Rw; %15 percent of the time
R_W2 = Rg + Rs + Rb + Rf; %85 percent of the time

%Composite R
R_W = ((AW1 + AW2) * (R_W1 * R_W2)) / ((AW1 * R_W2) + (AW2 * R_W1));

%%Roof R (m^2 K/W)

Rg = 0.10;              %gypsum      
Rp = 0.17;              %plywood sheathing
Ra = 0.08;              %asphalt

Rair = 0.18;            %air cavity
Rw = 0.55;              %wood stud

R_R1 = Rg + Rp + Ra + Rw;   %15 percent of the time
R_R2 = Rg + Rp + Ra + Rair; %85 percent of the time

%Composite R
R_R = ((AR1 + AR2) * (R_R1 * R_R2)) / ((AR1 * R_R2) + (AR2 * R_R1));


%%Floor R (m^2 K/W)

Rcarpet = 0.10;         %carpet     
Rconcrete = 0.17;       %poured concrete

Rf = 1.0;               %cavity-fiberglass
Rw = 0.55;              %wood stud

R_F1 = Rcarpet + Rconcrete + Rw;   %15 percent of the time
R_F2 = Rcarpet + Rconcrete + Rf;   %85 percent of the time

%Composite R
R_F = ((AF1 + AF2) * (R_F1 * R_F2)) / ((AF1 * R_F2) + (AF2 * R_F1));


%%Windows

R_P = 0.16;           %single pane

%%Door

R_D = 0.67;           %wood, hollow core

