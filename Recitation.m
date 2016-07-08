%% Recitation April 30

[x,fval,exitflag,output,lamda] = linprog(f,A,b,[],[],lb,[]);

%% Input:

f
A
b
lb




%% Output:

x =

    0.0000          %Num shipments from Seattle to NY
  300.0000          %Num shipments from Seattle to Chicago
    0.0000          %Num shipments from Seattle to Topeka
  325.0000          %Num shipments from San Diego to NY
    0.0000          %Num shipments from San Diego to Chicago
  275.0000          %Num shipments from San Diego to Topeka


fval =

   1.5368e+05       


exitflag =

     1


output = 

      iterations: 5
       algorithm: 'large-scale: interior point'
    cgiterations: 0
         message: 'Optimization terminated.'


lamda = 

    ineqlin: [5x1 double]
      eqlin: [0x1 double]
      upper: [6x1 double]
      lower: [6x1 double]
