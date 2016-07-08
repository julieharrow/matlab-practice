%Julie Harrow
%1.020 Problem Set5: Problem 3B 


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
z = zeros(1,emitted*T); %Zn 

figure(1)
b = 0.1; % mean displacement to account for buoyancy

%Adding velocity
vx_0 = 4500; %m/hr
z_0 = 2; %m
vz = 0; %z mean velocity

for t=1:T
    
    % Velocity Vector in the x direction
    vx = vx_0 * ((z(1,1:t*emitted))/z_0).^0.15;
    
    % Random Variance; Omega
    omegaX = sqrt(3)*unifrnd(-1,1,1,t*emitted); 
    omegaY = sqrt(3)*unifrnd(-1,1,1,t*emitted);
    omegaZ = sqrt(3)*(b + unifrnd(-1,1,1,t*emitted));
    
    % Location Vectors
    x(1,1:t*emitted) = x(1,1:t*emitted) + vx*dt + dx*omegaX(1:t*emitted);
    y(1,1:t*emitted) = y(1,1:t*emitted) + dy*omegaY(1:t*emitted);
    z(1,1:t*emitted) = z(1,1:t*emitted) + dz*omegaZ(1:t*emitted);
    
    %Reflective boundary  
    z = abs(z);   
    
    % Create 3D scatter plot
    scatter3(x,y,z,'.'); 
    
    % Define axis limits
    xlim([-200 16000]);
    ylim([-50 50]);
    zlim([0 50]);
    title(['time=',num2str(t)])
    pause(0.1);
end
title('Scatter plot of plume emitted from smoke stack at 2 hrs')
xlabel('x (m)'),ylabel('y (m)'),zlabel('z (m)');

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
        
    
    