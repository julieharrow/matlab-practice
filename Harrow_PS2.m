%Julie Harrow
%ProblemSet2Problem3


%Problem 3a
clear all
close all

x = (0:pi/20:6*pi)';
plot(x,exp(-0.2.*x).*sin(x))

%Problem 3b
close all
clear all

x = ones(1,20);
x(3) = 2;
for i = 3:20;
    x(i) = x(i-1)+x(i-2);
end

%Problem 3c
close all
clear all

g=9.8;
u=60;

s = zeros(1,100);

t = 0:.1:10;
for i = 1: length(t)
    s(i)=u*t(i)-g/2*t(i).^2;
end
plot(t,s), title('Vertical motion under gravity');
xlabel('time'), ylabel('vertical displacement'), grid;

% Problem 3d
clear all
close all

terms = 100;
pi = 0;
sign = 1;
for i = 1:terms
    pi = pi + sign * 4/(2*i - 1);
    sign = sign*(-1);
end

%Problem 3e
close all
clear all


theta=0:pi/100:2*pi;
for m = 1:length(theta)
    r(m)=sqrt(abs(2.*sin(5.*theta(m))));
end
figure(1), 
subplot(2,2,1), plot(theta,r, '-*');
subplot(2,2,2), plot(theta(2:2:200),r(2:2:200),'-*'); 
subplot(2,2,3), polar(theta,r);
subplot(2,2,4), polar(theta(2:2:200),r(2:2:200));




