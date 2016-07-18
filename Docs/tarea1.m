clear all;
clc;

figure;
hold on;

[x,y]= NACA4(2215);
plot(x,y,'b-');
grid on;
axis equal;
axis([-0.1,1.1,-0.2,0.2]);
title ('NACA 225, Italo Garleni');
xlabel('x');
ylabel('y');

hold off;