clear all;

r1 = 0.3;
r2 = 0.2;
beta12 = 1;
beta21 = 0.02;
K1 = 15;

M1 = [0,15,10];
M2 = [0,0,.1];

Jacobian = zeros(2,2);

for i  = (1:length(M1))
    dF1dM1(i) = (r1 - (2 * (r1 * M1(i)/K1) - beta12 * M2(i)));
    dF1dM2(i) = (-beta12 * M1(i));
    dF2dM1(i) = (M2(i) * beta21);
    dF2dM2(i) = (beta21 * M1(i) - r2);
end

Jacobian1 = [dF1dM1(1), dF1dM2(1); dF2dM1(1), dF2dM2(1)];
Jacobian2 = [dF1dM1(2), dF1dM2(2); dF2dM1(2), dF2dM2(2)];
Jacobian3 = [dF1dM1(3), dF1dM2(3); dF2dM1(3), dF2dM2(3)];

disp('jacob1:');
disp(Jacobian1);
disp('jacob2:');
disp(Jacobian2);
disp('jacob3:');
disp(Jacobian3);

eigenValues1 = eig(Jacobian1);
eigenValues2 = eig(Jacobian2);
eigenValues3 = eig(Jacobian3);

disp('eigen1:');
disp(eigenValues1);
disp('eigen2:');
disp(eigenValues2);
disp('eigen3:');
disp(eigenValues3);


