function methodHord
    a = -1;
    b = 0;
    eps = 10^(-3);
    [xk_b,i] = hord(a,b,eps)
    f_xk_b = f(xk_b)

    xk_z = fzero(@f,b)
    f_xk_z = f(xk_z)

function [x,i]=hord(a,b,eps)
    M1=27.716;
    m1=7.97;
    x0=b;
    x1=a;
    i=1;
    x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
    fprintf('%10s%15.7e%15s%15.7e\n',' x2= ',x2,' abs(f(x2))= ',abs(f(x2)))
    while(((M1-m1)/m1*abs(x2-x1) > eps) && (i <= 100))
        i=i+1;
        x1=x2;
        x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
        fprintf('%10s%15.7e%15s%15.7e\n',' x2= ',x2,' abs(f(x2))= ',abs(f(x2)))
    end
    x=x2;

%Здесь записано наше алгебраическое уравнение
%function y = f(x)
%   y = x^3 - 2*x^2 + 7*x + 3;
%Здесь трансцендентное уравнение
function y = f(x)
    y = exp(-x)-2;

