function methodEuler
    a = 1;
    b = 5;
    n = 10;
    y0 = 1/exp(1);
    [x, y] = euler(a,b,y0,n);
    
    x1 = 1 : 0.01 : 5;
    y1 = x1.^2 .* exp(-x1);
    [x2,y2] = ode23(@f,[1, 5],y0);
    plot(x,y);
    hold on;
    plot(x1,y1,'r');
    plot(x2,y2,'black');
    
    grid on;

function [x,y] = euler(a,b,y0,n)
    h = (b - a)/n;
    x(1) = a;
    y(1) = y0;
    for i = 2 : n
        x(i) = x(i-1) + h;
        y(i) = y(i-1) +h*f(x(i),y(i-1));
    end
    
    
function y = f(x,y)
    y = (3*x^2*exp(-x) - (x+1)*y)/x;
    
    
   