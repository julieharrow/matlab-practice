%1.020 Problem Set 9


% %% West (same for Central, South and North)
%  
% %LAND
% 
% land_west_1 + land_west_2 + land_west_3 + land_west_4 + land_west_5 + land_west_6 <= land_west_arable
% 
% land_west_1 + land_west_2 + land_west_3 + land_west_4 + land_west_5 + land_west_6 + land_west_7 <= land_west_total
% 
% %WATER
% 
% precip_west_total = precip_west_nominal * IPCC_west
% 
% PET_west_1 = PET_west_nominal * land_west_1 * factor_1
% PET_west_2 = PET_west_nominal * land_west_2 * factor_2
% PET_west_3 = PET_west_nominal * land_west_3 * factor_3
% PET_west_4 = PET_west_nominal * land_west_4 * factor_4
% PET_west_5 = PET_west_nominal * land_west_5 * factor_5
% PET_west_6 = PET_west_nominal * land_west_6 * factor_6
% PET_west_7 = PET_west_nominal * land_west_7 * 0.9
% 
% PET_west_total = PET_west_1 + PET_west_2 + PET_west_3 + PET_west_4 + PET_west_5 + PET_west_6 + PET_west_7
% 
% PET_west_total + runoff_west = precip_west_total
% 


%% Variables

%LAND  (10^6 ha)

land_west_arable = 170;         
land_central_arable = 74;       
land_south_arable = 121;        
land_north_arable = 123;   

land_west_total = 301;          
land_central_total = 153;       
land_south_total = 186;         
land_north_total = 295;      

%WATER (mm/yr)

precip_west_nominal = 134;       
IPCC_west = 1.14;             
precip_west_total = precip_west_nominal * IPCC_west    

precip_central_nominal = 414;       
IPCC_central = 1.12;             
precip_central_total = precip_central_nominal * IPCC_central  

precip_north_nominal = 551;       
IPCC_north = 1.13;             
precip_north_total = precip_north_nominal * IPCC_north  

precip_south_nominal = 1123;       
IPCC_south = 1.7;             
precip_south_total = precip_south_nominal * IPCC_south  


PET_west_nominal = 1372       
PET_central_nominal = 1033    
PET_north_nominal = 1016      
PET_south_nominal = 988       

%CROP

                        %(kg/capita/yr)
contribution_1 = 104.64;
contribution_2 = 79.62;
contribution_3 = 91.8;
contribution_4 = 145.13;
contribution_5 = 64.51;
contribution_6 = 314.78;


                        %(kg/ha/yr)
yield_1 = 5288;
yield_2 = 4275;
yield_3 = 4171;
yield_4 = 18169;
yield_5 = 1916;
yield_6 = 19114;


factor_1 = 0.82;
factor_2 = 0.83;
factor_3 = 1.10;
factor_4 = 0.89;
factor_5 = 0.83;
factor_6 = 0.88;
factor_7 = 0.90;


%% Matrices

x = [land_west_1; land_west_2; land_west_3; land_west_4; land_west_5; land_west_6; land_west_7;...
    land_central_1; land_central_2; land_central_3; land_central_4; land_central_5; land_central_6; land_central_7;...
    land_south_1; land_south_2; land_south_3; land_south_4; land_south_5; land_south_6; land_south_7;...
    land_north_1; land_north_2; land_north_3; land_north_4; land_north_5; land_north_6; land_north_7;...
    runoff_west; runoff_central; runoff_south; runoff_north; peopleFed];

load ps9variables

