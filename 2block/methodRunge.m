function methodRunge
    a = 1;
    b = 5;
    y0 = 1/exp(1);
    n = 10;
    [x, y] = runge(a,b,y0,n);
    
    x1 = 1 : 0.01 : 5;
    y1 = x1.^2 .* exp(-x1);
    [x2,y2] = ode45(@f,[1, 5],y0);
    plot(x,y);
    hold on;
    plot(x1,y1,'r');
    plot(x2,y2,'g');
    grid on;
    
    
function[x,y] = runge(a,b,y0,n)
    h = (b - a)/n;
    x(1) =a;
    y(1) = y0;
    for i = 1 : n
        k1 = f(x(i), y(i));
        k2 = f(x(i) +h/2, y(i) +h*k1/2);
        k3 = f(x(i) + h/2, y(i) + h *k2/2);
        k4 = f(x(i) + h, y(i) + h*k3);
        y(i+1) = y(i) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
        x(i+1) = x(i) + h;
    end



function y = f(x,y)
    y = (3*x^2*exp(-x) - (x+1)*y)/x;
    