%PSet1Task2

A1 = [3;1];
A2 = [1;2];
x1 = [0:3];
y1 = x1./3;
x2 = [0:1];
y2 = x2.*2;
x1R = [1:4];
y1R = x1R./3 + (2-(1/3));
y2R = [1:3];
x2R = y2R./2 +(3-.5);
plot(x1,y1,'r-',x2,y2,'r-',x1R,y1R,'r-',x2R,y2R,'r-');
axis([0,4,0,4]);
text(2.5,3.5,'Area = 5 units squared')