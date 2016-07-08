%Julie Harrow
%1.020 Problem Set5: Problem 3B 


% Simulation time
dt = 0.02; % time step (hours)
T = 100; % time steps

% Particles emitted over time step dt
emitted = 10;
% Mass of each particle : 1 particle theoretically equals 120 kg 
    % ----> yields 1200 kg/hr
Memitted = emitted*120;

% Dispersion coefficients (m2/hr)
Dx = 40; 
Dy = 40;
Dz = 40; 

%Dispersion terms of random displacement (epsilon)
dx = sqrt(2*Dx*dt);  
dy = sqrt(2*Dy*dt);  

% particle initialization
x = 100*unifrnd(0,60,1,T*emitted); %Xn
x_0 = 100*unifrnd(0,60,1,T*emitted); %Xn_0
y = zeros(1,emitted*T); %Yn 
z = zeros(1,emitted*T); %Zn 

figure(1)
b_0 = 0.3; % mean displacement to account for buoyancy
z_inv = 30; %m

%Adding velocity
vx_0 = 4500; %m/hr
z_0 = 2; %m
vz = 0; %z mean velocity

for t=1:T
    
    % Buoyancy effect at inversion boundary
    booleanVector = b_0 * (z(1,1:t*emitted) < z_inv);
     
    for i = 1:length(booleanVector)
        if booleanVector(i) == b_0
            dz = sqrt(2*Dz*dt); 
        else 
            dz = .1*sqrt(2*Dz*dt);
        end
    end    
    
    % Velocity Vector in the x direction
    vx = vx_0 * ((z(1,1:t*emitted))/z_0).^0.15;
    
    % Random Variance; Omega
    omegaX = sqrt(3)*unifrnd(-1,1,1,t*emitted); 
    omegaY = sqrt(3)*unifrnd(-1,1,1,t*emitted);
    omegaZ = sqrt(3)*(booleanVector + unifrnd(-1,1,1,t*emitted));
    
    % Location Vectors
    x(1,1:t*emitted) = x(1,1:t*emitted) + vx*dt + dx*omegaX(1:t*emitted);
    y(1,1:t*emitted) = y(1,1:t*emitted) + dy*omegaY(1:t*emitted);
    z(1,1:t*emitted) = z(1,1:t*emitted) + dz*omegaZ(1:t*emitted);
    
    %Reflective boundary  
    z = abs(z);   
   
    % Create 3D scatter plot
    scatter3(x,y,z,'k.'); 
    
    % Define axis limits
    xlim([-200 16000]);
    ylim([-50 50]);
    zlim([0 50]);
    title(['time=',num2str(t)])
    pause(0.1);
end
title('Scatter plot of plume emitted from road for 2 hours with Z_inv')
xlabel('x (m)'),ylabel('y (m)'),zlabel('z (m)');

% Y and Z grid boundaries


figure(2)

zmin = 0;
zmax = 50;
ymin = -50;
ymax = 50;
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

%Conversion for Concentration Gradient
%2500 g/km/hr = particle mass * particles/hr/km
%2500g/km = 2500g/km/hr * .02 = 50
%particlemass = .3 kg/particle
volumeCell = 2000*delty*deltz;
concentration = .3*ccontour / (volumeCell);

contourf(ycontour,zcontour,concentration) %create contour plot
colorbar
title('Concentration Density (x = 6000 to 8000)')
xlabel('Y Location')
ylabel('Z Location')
        


figure(3)

zmin = 0;
zmax = 50;
ymin = -50;
ymax = 50;
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
            (z>=gridz(iz)) & (z<=gridz(iz+1)) & ((x>=8000)&(x<=10000)));
    end
end

%Conversion for Concentration Gradient
%2500 g/km/hr = particle mass * particles/hr/km
%2500g/km = 2500g/km/hr * .02 = 50
%particlemass = .3 kg/particle
volumeCell = 2000*delty*deltz;
concentration = (.3*ccontour) / (volumeCell);

contourf(ycontour,zcontour,concentration) %create contour plot
colorbar
title('Concentration Density (x = 8000 to 10000)')
xlabel('Y Location')
ylabel('Z Location')
        
       
    