
%Inputs
numLinks = 4;  % number of links in network
numNodes = 3;  % number of nodes in network
linklength = [80 60 100 120];  % list of link lengths
tintercept = [0.2 0.1 0.3 0.4];  % intercepts of linear time function
alpha = [0.003 0.003 0.003 0.002];  % slopes of linear time function
paths = ??:  % table of link paths from origin to destination

x_in = 4000;  %veh/hr
x_out = x_in;  

%Interpolation
CO = [6 18; 16 20; 24 22; 32 23; 40 20; 48 18; 56 15;...
 		64 14; 72 12; 80 8; 89 5; 97 10; 105 15];

plot(CO(:,1),CO(:,2),'*')
xlabel('Speed (km/hr)')
ylabel('CO Rate (g/L)')
linkvel = 50:
gamma=interp1(CO(:,1),CO(:,2),linkvel);


FuelCon = [15 .13; 25 .115; 30 .1; 40 .092; 48 .09; 56 .091;...
		65 .092; 72 .091; 82 .089; 88 .089; 95 .092; 115 .105];


%Bar
x = 1:5;
Y = round(100*rand(1,4)));
%Y = randi(100,1,4)
bar(x,Y);

