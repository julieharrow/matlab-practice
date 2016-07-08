%Julie Harrow
%1.020 PSet4: Problem 4 Part A/B


%%Series of Equations (8 total)
 
% Voltage (Ohm)
% 1:  0 = v_1 - r_1 * i_1;
% 2:  0 = v_2 - r_2 * i_2;
% 3:  0 = v_ 3- r_3 * i_3;
% 4:  0 = v_4 - r_4 * i_4;


% Voltage (Kirchhoff)
% 5:  0 = v_1 - v_2;
% 6:  0 = v_4 - v_1 - v_3;
 

% Current
% 7:  I = i_1 + i_2 + i_4;
% 8:  I = i_3 + i_4;


%%Unknowns

r_1 = 2;
r_2 = 2;
r_3 = 1;
r_4 = 1;
I = 12;


%Maxtrix of Equations

A = zeros(8);

A(1,[1,2]) = [1, -r_1];
A(2,[3,4]) = [1, -r_2];
A(3,[5,6]) = [1, -r_3];
A(4,[7,8]) = [1, -r_4];
A(5,[1,3]) = [1, -1];
A(6,[1,5,7]) = [-1, -1, 1];
A(7,[2,4,7]) = [1, 1, 1];
A(8,[5,7]) = [1, 1];


%Column of Solutions

b = [0;0;0;0;0;0;I;I];


%Colum of Unknowns 

%x = [v_1; i_1; v_2; i_2; v_3; i_3; v_4; i_4];

x = A\b;

% x =
% 
%      4
%      2
%      4
%      2
%      4
%      4
%      8
%      8
% 

