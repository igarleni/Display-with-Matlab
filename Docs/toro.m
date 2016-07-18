% inicializamos el espacio de trabajo
clear all;
clc;
% inicializamos las constantes
R1 = 3;
R2 = 1;
Nt = 20;
Np = 50;
% generamos el mallado
theta =linspace(0,2*pi,Nt);
phi = linspace(0,2*pi,Np);
[Theta,Phi] = meshgrid(theta,phi);
% generamos las coordenadas de los puntos
X = (R1 + R2*cos(Theta)).*cos(Phi);
Y = (R1 + R2*cos(Theta)).*sin(Phi);
Z = R2*sin(Theta);
% visualizamos
surf(X,Y,Z);
axis equal;
% solamente en MALLAB, en Octave no utilizar
cameratoolbar;