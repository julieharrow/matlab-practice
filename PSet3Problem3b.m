%PSet3Problem3b

clear all;

%constants
r1 = 0.3;
r2 = 0.2;
beta12 = 1;
beta21 = 0.02;
K1 = 15;

%time
t = 0:.1:100;
dt = 1;

for k = (1:2)
    
    if k == 1
         
        %mass values
        M1values = [0.1,14.9,10.1];
        M2values = [0.1,0.11,.2];
        
    elseif k == 2
        
        %mass values
        M1values = [0,15,10];
        M2values = [0,0,.1];
        
    end
           
    if length(M1values) ~= length(M2values)
        error('Incorrect input values.')
    end
    
    %incremental equations
    M1 = zeros(length(M1values),length(t));
    M2 = zeros(length(M1values),length(t));
    
    for j = (1: length(M1values))
        M1(j,1) = M1values(j);
        M2(j,1) = M2values(j);
        for i = (1:length(t)-1)
            
            M1(j, i+1) = (r1 * M1(j,i) * (1- (M1(j,i)/K1)) - beta12 * M1(j,i) * M2(j,i))...
                * dt + M1(j,i);
           
            M2(j, i+1) = (beta21 * M1(j,i) * M2(j,i) - r2 * M2(j,i)) * dt + M2(j,i);
            
        end
    end
    
    figure
    
    plot(M1(1,:), M2(1,:),'k')
    xlabel('M1 (Equilibrium M_0 = 0)')
    ylabel('M2 (Equilibrium M_0 = 0)')
    title('UNSTABLE: Divergence from Equilbrium [0,0] - Convergence to Equilbrium [10,0.1]')
    
    figure
    
    plot(M1(2,:), M2(2,:),'k')
    xlabel('M1 (Equilibrium M_0 = 15)')
    ylabel('M2 (Equilibrium M_0 = 0)')
    title('UNSTABLE: Divergence from Equilbrium [15,0] - Convergence to Equilbrium [10,0.1]')
    
    figure
    
    plot(M1(3,:), M2(3,:),'k')
    xlabel('M1 (Equilibrium M_0 = 10)')
    ylabel('M2 (Equilibrium M_0 = 0.1)')
    title('STABLE: Convergence to Equilibrium [10,0.1]')
 
end


