clear all;
clc;

airfoil = AirfoilNACA644X(20);

figure;

hold on;
plot(airfoil.xu,airfoil.yu,'r-');
plot(airfoil.xl,airfoil.yl,'r-');
grid on;
axis equal;
axis([-0.1,1.1,-0.2,0.2]);
title ('NACA 644XX, Italo Garleni');
hold off;

figure;

hold on;
plot(airfoil.alpha,airfoil.CL,'b^-');
plot(airfoil.alpha,airfoil.CD,'ro-');
grid on;
axis([-20,40,-1,2]);
title ('NACA 644XX, Italo Garleni - Stats');
hold off;