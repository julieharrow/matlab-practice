% Recitation 5 03/12/2010
% Particle tracking 2D 
% Simplified random walk model (dispersion only)
% of particle transport from a continuous point source 
close all

%% Part I: 2D Particle Tracking, Instantaneous Point Source
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
dx = sqrt(2*Dx*dt);  % x displacement length scale (epsilon X)
dy = sqrt(2*Dy*dt);  % y displacement (epsilon Y)
 
% particle initialization
x = zeros(1,emitted*T); %Xn
y = zeros(1,emitted*T); %Yn

%------------------------------------------

figure(1)

for t=1:T
    
    % unit variance random x var
    omegaX = sqrt(3)*unifrnd(-1,1,1,t*emitted); 

    % unit variance random y var
    omegaY = sqrt(3)*unifrnd(-1,1,1,t*emitted);
    
    % coords of particles emitted through current time 
    x(1,1:t*emitted) = x(1,1:t*emitted) + dx*omegaX(1:t*emitted);
    y(1,1:t*emitted) = y(1,1:t*emitted) + dy*omegaY(1:t*emitted);
    
    
    % create scatter plot
    scatter(x,y,'.');  
    % define axis limits
    xlim([-50 50]);
    ylim([-50 50]);
    title(['time=',num2str(t)])
    pause(0.1);
end
title('Scatter plot of plume emitted from smoke stack at 2 hrs')
xlabel('x (m)'),ylabel('y (m)');


%% Part II: 3D Particle Tracking with Velocity

% Recitation 5 03/12/2010
% Particle tracking 2D 
% Simplified random walk model (dispersion only)
% of particle transport from a continuous point source 
close all

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


%% Part III:  Counting Random Numbers Efficiently

tic % if you start your code with tic and end it with toc, matlab will
    % calculate and record the time that it took to run that portion of the
    % script.
    
c = 0;
d = 0;
for n = 1:5000
    r = rand; %generate one number per loop
    if r < 0.5
        c = c+1;
    else
        d = d+1;
    end
end

time1 = toc

%A more efficient way to code the script above:
tic

r = rand(1,5000);
a = sum(r<0.5);
b = sum(r>=0.5);

time2 = toc

% time1 should be greater than time2

%% Part IV:  Using contourf(Y,Z,C) function: Y,Z = location and C = conc

% Recitation 5 03/12/2010
% Particle tracking 2D 
% Simplified random walk model (dispersion only)
% of particle transport from a continuous point source 
close all

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
        
    
    