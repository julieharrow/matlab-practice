%PSet1Problem1f

Cin = 10;
q = 1;
V = 1000;
alpha = 0.01;
r = q/V;

t = 0:20:100;

constant = ((r*Cin)/(r+alpha));
C_of_t = constant - constant./((exp(1)).^((r + alpha).*t));

incConc = [0,.2,.356,.478,.573,.647];

plot(t,C_of_t,'-.k',t,incConc,'k');
title('Mass Balance Equation of Pond');
xlabel('time (seconds)');
ylabel('concentration (g/ m^3)');

text(20,.6,'Incremental Form:  Solid');
text(20,.55,'Rate Form:  Dashed');






