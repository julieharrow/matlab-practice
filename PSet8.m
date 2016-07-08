%Julie Harrow
%1.020 Problem Set 8

%% Concrete Bridge

A_concrete = xlsread('ConcreteA.xls');

B_concrete = xlsread('ConcreteB.xls');

f_concrete = [24.75;0;0;0;0;0;0;0;0;0;553.6977;0;0;0;0;0;0;0];

%% Timber Bridge

A_timber = xlsread('TimberA.xls');

B_timber = xlsread('TimberB.xls');

f_timber = [0;0;0;0;4.635;4.5;0;0;0;0;0;0;0;0];


%% FORMULAE 

s_concrete = A_concrete \ f_concrete

g_concrete = B_concrete * s_concrete

s_timber = A_timber \ f_timber

g_timber = B_timber * s_timber