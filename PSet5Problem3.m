%Julie Harrow
%1.020 Problem Set 5: Problem 3

% Simulation time
dt = 0.02; % time step (hours)
T = 100; % time steps
time = 0:dt:T*dt; %simulation time vector

% Particles emitted over time step dt
emitted = 10;

% Dispersion coefficients (m2/hr)
Dx = 40; 
Dy = 40;
Dz = 40; 

%Dispersion terms of random displacement (epsilon)
dx = sqrt(2*Dx*dt);  
dy = sqrt(2*Dy*dt); 
dz = sqrt(2*Dz*dt); 

% particle initialization
x = zeros(1,emitted*T); %Xn
y = zeros(1,emitted*T); %Yn
z = zeros(1,emitted*T) + 10; %Zn + (height of smokestack)

%------------------------------------------

figure(1)

% Buoyancy Term and Inversion boundary
z_inv = 30; %m
b_0 = 0.3; % mean displacement to account for buoyancy

% Velocity Values (m/hr)
vx_0 = 4500; 
z_0 = 2; 
vz = 0; %z mean velocity

for t=1:T
    
    % Random omega values
    omegaX = sqrt(3)*unifrnd(-1,1,1,t*emitted); 
    omegaY = sqrt(3)*unifrnd(-1,1,1,t*emitted);
    omegaZ = sqrt(3)*(b + unifrnd(-1,1,1,t*emitted));
    
    % Velocity Vector
    vx = vx_0 * ((z(1,1:t*emitted))/z_0).^0.15;
    
    % Coordinates of particles emitted through current time 
    x(1,1:t*emitted) = x(1,1:t*emitted) + vx*dt + dx*omegaX(1:t*emitted);
    y(1,1:t*emitted) = y(1,1:t*emitted) + dy*omegaY(1:t*emitted);
    z(1,1:t*emitted) = z(1,1:t*emitted) + dz*omegaZ(1:t*emitted);
    
    %Reflective boundary
    z = abs(z);     
    
    % Buoyancy effect at inversion boundary
    if z(1,1:t*emitted) < z_inv
        b = b_0;
    else
        b = 0;
    end
    
    % Create scatter plot
    scatter3(x,y,z,'.');  %change to scatter3 for 3D plot
    % Define axis limits
    xlim([-200 16000]);
    ylim([-50 50]);
    zlim([0 50]);
    title(['time=',num2str(t)])
    pause(0.1);
end
title('Scatter plot of plume emitted from smoke stack at 2 hrs')
xlabel('x (m)'),ylabel('y (m)'),zlabel('z (m)');



%%Part IV:  Using contourf(Y,Z,C) function: Y,Z = location and C = conc

%------------------------------------------
% Simulation time
dt = 0.02; % time step (hours)
T = 100; % time steps
time = 0:dt:T*dt; %simulation time vector
%------------------------------------------

%------------------------------------------
% particles emitted over time step dt
emitted = 10;

% Dispersion coefficient
Dx = 40; % x dispersion coef (m2/hr)
Dy = 40; % y dispersion coef
Dz = 40; % z dispersion coef
dx = sqrt(2*Dx*dt);  % x displacement length scale (epsilon X)
dy = sqrt(2*Dy*dt);  % y displacement (epsilon Y)
dz = sqrt(2*Dz*dt);  % z displacement (epsilon Z)

% particle initialization
x = zeros(1,emitted*T); %Xn
y = zeros(1,emitted*T); %Yn
z = zeros(1,emitted*T) + 10; %Zn + (height of smokestack)

%------------------------------------------

figure(1)
b = 0.3; % mean displacement to account for buoyancy

%Adding velocity
vx_0 = 4500; %m/hr
z_0 = 2; %m
vz = 0; %z mean velocity

for t=1:T
    
    % unit variance random x var
    omegaX = sqrt(3)*unifrnd(-1,1,1,t*emitted); 

    % unit variance random y var
    omegaY = sqrt(3)*unifrnd(-1,1,1,t*emitted);
    
    % unit variance random z var
    omegaZ = sqrt(3)*(b + unifrnd(-1,1,1,t*emitted));
    
    % coords of particles emitted through current time 
    vx = vx_0 * ((z(1,1:t*emitted))/z_0).^0.15;
    x(1,1:t*emitted) = x(1,1:t*emitted) + vx*dt + dx*omegaX(1:t*emitted);
    % add velocity component to x position
    y(1,1:t*emitted) = y(1,1:t*emitted) + dy*omegaY(1:t*emitted);
    z(1,1:t*emitted) = z(1,1:t*emitted) + dz*omegaZ(1:t*emitted);
    z = abs(z); %Reflective boundary    
    
    % create scatter plot
    scatter3(x,y,z,'.');  %change to scatter3 for 3D plot
    % define axis limits
    xlim([-200 16000]);
    ylim([-50 50]);
    zlim([0 50]);
    title(['time=',num2str(t)])
    pause(0.1);
end
title('Scatter plot of plume emitted from smoke stack at 2 hrs')
xlabel('x (m)'),ylabel('y (m)'),zlabel('z (m)');


%(ABOVE IS SAME CODE FROM PART III) NEW PART STARTS HERE:

% Count Number of Particles in each cell (for problemSet 3)

% Define concentration grid

% Y and Z grid boundaries

zmin = 20;
zmax = 40;
ymin = -30;
ymax = 30;
gridy(1) = ymin;
gridz(1) = zmin;
ngrid =10;
delty = (ymax - ymin) / ngrid; %width of each cell
deltz = (zmax - zmin) / ngrid; %height of each cell

for i = 1:ngrid
    gridy(i+1) = gridy(i) + delty;
    gridz(i+1) = gridz(i) + deltz;
    ycontour(i) = (gridy(i) + gridy(i+1))/2; %middle y location of cell
    zcontour(i) = (gridz(i) + gridz(i+1))/2; %middle z location of cell
end

% particle counting in each grid
for iy = 1:ngrid
    for iz = 1:ngrid
        ccontour(iy,iz) = sum((y>=gridy(iy)) & (y<=gridy(iy)+1)&...
            (z>=gridz(iz)) & (z<=gridz(iz+1)) & ((x>=6000)&(x<=8000)));
    end
end

figure(2)
contourf(ycontour,zcontour,ccontour) %create contour plot
xlim([0,25])  %Setting border limits in x direction
ylim([20,40]) %Setting border limits in y direction
title('Concentration Density')
xlabel('Y Location')
ylabel('Z Location')
        