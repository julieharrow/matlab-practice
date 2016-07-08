
% Julie Harrow
% 1.020 PSet2 Problem 2c
% Incremental Form Solution

clear all

%Time
t = 0:1:39;
dt = 1;

%Constants
rho = 1000; %kg/m^3
a = 0.25; %hr^-1

%Precipitation Function
P = zeros(1,length(t));
P(1) = 6000;
P(2) = 6000;
P(3) = 6000;
P(4) = 6000;


%Initial condition
V1 = zeros(1,length(t));
V2 = zeros(1,length(t));
V3 = zeros(1,length(t));
q = zeros(1,length(t));
InflowVector = zeros(1,length(t)+1);
OutflowVector = zeros(1,length(t)+1);


for i = 1:length(t)
    V1(i+1) = (P(i)-a*V1(i))*dt + V1(i);
    V2(i+1) = ((V1(i) - V2(i)) * a * dt) + V2(i);
    V3(i+1) = ((V2(i) - V3(i)) * a * dt) + V3(i);
    q(i) = a * V3(i);
    Inflow = P(i) * dt;
    Outflow = q(i) * dt;
    InflowVector = [InflowVector, Inflow];
    OutflowVector = [OutflowVector, Outflow];
end

plot(t,P,'--',t,q);
title('Predicting Stream Flow');
xlabel('Time (hr)');
ylabel('Rate of Flow (m^3/ hr)');
text(5, 4500,'Precipitation - dashed line');
text(5, 4000, 'Downstream Flow - solid line');

totalInflow = sum(InflowVector);
totalOutflow = sum(OutflowVector);
