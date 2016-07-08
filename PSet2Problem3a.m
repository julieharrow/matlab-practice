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
