clear all;
clc;

imagen = (imread('imagen.png'));
Nf = size(imagen,1);
Nc = size(imagen,2);
x1 = linspace(0,1,Nc);
y1 = linspace(0,1,Nf)*Nf/Nc;
[X,Y] = meshgrid(x1,y1);
Z = 0.7*(X.^2+Y.^2);
C = double(imagen(:,:,1));

hold on;
surf(X,Y,Z,C);

shading interp;
colormap 'summer';
axis equal;
axis off;
whitebg('black');
title('Imagen3D, Italo Garleni');
hold off;
cameratoolbar;