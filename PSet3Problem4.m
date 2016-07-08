%PSet3Problem4

%Inputs
t = (0:0.5:10000); %seconds
dt = 0.5;
Np_1 = zeros(1,length(t));
Np_2 = zeros(1,length(t));
Nz = zeros(1,length(t));
Nd = zeros(1,length(t));

%Constants
gz = 0.2;
rz = 0.01;
eff = 0.2;
Nph = 60;
gp_1 = 0.3;
Ndh_1 = 80;
rp_1 = 0.2;
gp_2 = 0.3;
Ndh_2 = 81;
rp_2 = 0.2;



for j = (1:3)
    
    if j == 1
        %Case 1
        Np_1(1) = 60;
        Np_2(1) = 60;
        Nz(1) = 20;
        Nd(1) = 200;
        Nitrogentotal = zeros(1,length(t));
        Nitrogentotal(1) = 340;
        
    elseif j ==2
        %Case 2
        Np_1(1) = 60;
        Np_2(1) = 60;
        Nz(1) = 200;
        Nd(1) = 20;
        Nitrogentotal = zeros(1,length(t));
        Nitrogentotal(1) = 340;
        
    elseif j ==3
        %Case 3
        Np_1(1) = 100;
        Np_2(1) = 300;
        Nz(1) = 20;
        Nd(1) = 20;
        Nitrogentotal = zeros(1,length(t));
        Nitrogentotal(1) = 440;
        
    end
    
    
    
    for i = (1:length(t)-1)
        
        Nz(i+1) = (eff * gz * Nz(i) * ((Np_1(i) + Np_2(i))/(Nph...
            + Np_1(i) + Np_2(i))) - rz * Nz(i)) * dt + Nz(i);
        
        Np_1(i+1) = (gp_1 * Np_1(i) * (Nd(i)/(Ndh_1 + Nd(i))) ...
            - rp_1 * Np_1(i) - gz * Nz(i) * (Np_1(i)/(Nph + ...
            Np_1(i)+Np_2(i)))) * dt + Np_1(i);
        
        Np_2(i+1) = (gp_2 * Np_2(i) * (Nd(i)/(Ndh_2 + Nd(i))) - ...
            rp_2 * Np_2(i) - gz * Nz(i) * (Np_2(i)/(Nph + Np_2(i)...
            + Np_1(i)))) * dt + Np_2(i);
        
        Nd(i+1) = (rp_1 * Np_1(i) + rp_2 * Np_2(i) + rz * Nz(i) ...
            - ((gp_1 * (Nd(i) * Np_1(i))/(Ndh_1 + Nd(i))) + ((gp_2*...
            (Nd(i) * Np_2(i))/(Ndh_2 + Nd(i)))) ...
            + (1 - eff) * gz * Nz(i) * ((Np_1(i)/(Nph + Np_1(i) ...
            + Np_2(i)))) + (Np_2(i)/(Nph + Np_2(i) + Np_1(i)))))...
            * dt + Nd(i);
        
        Nitrogentotal(i+1) = Nz(i+1)+Np_1(i+1)+Np_2(i+1)+Nd(i+1);
        
    end
    
    figure
    
    plot( t, Nitrogentotal,'k.-', t,Nz,'k', t, Nd,'k', t, Np_1, ...
        'k',t, Np_2,'k'); 

    title('Compartmentalized Nitrogen Ecosystem');
    xlabel('Time');
    ylabel('Nitrogen Masses');
    text(400,300,'Black lines: Masses');
    text(400,250,'Bold line: Total Mass');
            
 end
          
            

     
   
        
        


    
    



















