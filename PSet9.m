%Julie Harrow
%1.020 Problem Set 9

load ProblemSet9VariablesTask3

f;
A;
b;
Aeq;
beq;
lb;

[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,[])

% x =
% 
%    1.0e+03 *
% 
%     2.9197
%     0.7159
%     0.4570
%     0.2983
%     0.4104
%     0.2899
%     0.0105
%     1.7834
%     0.6127
%     0.8648
%     0.3357
%     1.2480
%     0.3194
%     0.0067
%     2.4105
%     0.6999
%     0.5531
%     0.3178
%     1.0253
%     0.3086
%     0.0048
%     1.8953
%     0.6213
%     0.7924
%     0.3339
%     1.2425
%     0.3185
%     0.0061
%     0.0582
%     0.2465
%     0.3666
%     0.2823
%     0.5040
% 
% 
% fval =
% 
%  -503.9533
% 
% 
% exitflag =
% 
%     -2
% 
% 
% output = 
% 
%       iterations: 10
%        algorithm: 'large-scale: interior point'
%     cgiterations: 0
%          message: [1x242 char]
% 
% 
% lambda = 
% 
%     ineqlin: [10x1 double]
%       eqlin: [8x1 double]
%       upper: [33x1 double]
%       lower: [33x1 double]