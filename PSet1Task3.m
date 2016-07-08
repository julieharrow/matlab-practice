%PSet1Task3

t = 0:100;
g = 9.8;
d = 0.5*g.*(t.^2);

subplot(2,1,1);
plot(t,d,'k*');
title('Free-Falling Body');
xlabel('time (seconds)');
ylabel('distance (meters)');
subplot(2,1,2);
loglog(t,d,'k^');
title('Logarithmic Free-Falling Body');
xlabel('log time');
ylabel('log distance');
