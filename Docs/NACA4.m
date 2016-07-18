function [x,y] = NACA4(arg1,arg2,arg3,arg4)
% provides the x, y coordinates of a 4-digit NACA airfoil
%
%   [x,y] = NACA(number,panels)
%   [x,y] = NACA4(m,p,t,panels)
%
% where number is the full NACA number, eg. 2215, and panels is optional panel number, default=100
% and m,p,t are the NACA parameters
% Juan Mendez, juan.mendez@ulpgc.es

    if nargin < 3
        numero = arg1;
        v1 = floor(numero/100);
        m = floor(numero/1000);
        p = v1 - m*10;
        t = numero - v1*100;
        % valores unitarios
        m = m/100;
        p = p/10;
        t = t/100;
        if nargin == 1
            paneles = 100;
        else
            paneles = arg2;
        end
    else
        m = arg1;
        p = arg2;
        t = arg3;
        if nargin > 3
            paneles = arg4;
        else
            paneles = 100;
        end
    end

    beta = 0:pi/paneles:pi;

    x = 0.5*(1+cos(beta));
    Index1 = find(x<=p);
    Index2 = find(x>p);

    if m ~= 0 & p ~= 0
        yc(1,Index1) = (m/(p*p))*x(Index1).*(2*p-x(Index1));
        yc(1,Index2) = (m/((1-p)*(1-p)))*(1-2*p+2*p*x(Index2)-x(Index2).*x(Index2));
    end

    yt = (t/0.2)*(0.2969*sqrt(x)- 0.1260*x - 0.3537*x.*x + 0.2843*x.*x.*x - 0.1015*x.*x.*x.*x.*x);

    if m == 0 | p == 0
        yu = yt;
        yl = -yt;
        xu = x;
        xl = x;
    else    
        deltax  = diff(x);
        deltayc = diff(yc);
        theta = [atan2(deltayc,deltax), 0];

        sintheta = sin(theta);
        costheta = cos(theta);

        xu = x - yt.*sintheta;
        yu = yc + yt.*costheta;
        xl = x + yt.*sintheta;
        yl = yc - yt.*costheta;
    end

    x = [xu,  xl(end-1:-1:1)];
    y = [yu, yl(end-1:-1:1)];
end