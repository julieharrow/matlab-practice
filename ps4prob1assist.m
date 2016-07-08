%Julie Harrow
%1.020 PSet4:  Problem #1:  Transportation Network

%%Inputs

links = 1:4;  % number of links in network
nodes = 1:3;  % number of nodes in network
linklength = [80 60 100 120];  % list of link lengths
t_0 = [0.2 0.1 0.3 0.4];  % intercepts of linear time function
alpha = [0.003 0.003 0.003 0.002];  % slopes of linear time function
x_in = 4000;  %veh/hr
x_out = x_in;  %veh/hr


%%Matrix of Equations

A(1,[1,5]) = [1,-alpha(1)];
A(2,[2,6]) = [1,-alpha(2)];
A(3,[3,7]) = [1,-alpha(3)];
A(4,[4,8]) = [1,-alpha(4)];
A(5,[5,7,8]) = [1,1,1];
A(6,[1,2]) = [-1,1];
A(7,[1,2,4]) = [1,1,-1];
A(8,[3,4]) = [1,-1];

%%Column of Constants 

b = [t_0(1); t_0(2); t_0(3); t_0(4); x_in; 0; 0; 0];

%%Solutions
 
x = A\b;

t_1 = x(1); 
t_2 = x(2);
t_3 = x(3);
t_4 = x(4);
x_1 = x(5);
x_2 = x(6);
x_3 = x(7);
x_4 = x(8);


%%Compute Velocity of 4 Links

vel(1) = linklength(1) / t_1;
vel(2) = linklength(2) / t_2;
vel(3) = linklength(3) / t_3;
vel(4) = linklength(4) / t_4;

%Interpolation
CO = [6 18; 16 20; 24 22; 32 23; 40 20; 48 18; 56 15;...
    64 14; 72 12; 80 8; 89 5; 97 10; 105 15];

%%Compute Emission Rates of 4 Links

emission(1)=interp1(CO(:,1),CO(:,2),vel(1));
emission(2)=interp1(CO(:,1),CO(:,2),vel(2));
emission(3)=interp1(CO(:,1),CO(:,2),vel(3));
emission(4)=interp1(CO(:,1),CO(:,2),vel(4));

%%Two bar charst

figure
bar(links,[x_1,x_2,x_3,x_4])
xlabel('Link Number')
ylabel('Vehicles per Hour')
title('Transportation: Vehicles per Hour')

figure
bar(links,emission)
xlabel('Link Number')
ylabel('Emission Rates (g/L)')
title('Transportation: Emission Rates')


