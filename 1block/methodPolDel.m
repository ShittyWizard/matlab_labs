function methodPolDel
    a = -1;
    b = 0;
    eps = 10^(-18);
    [xk_b,i] = bisection(a,b,eps)
    f_xk_b = f(xk_b)
    
    xk_z = fzero(@f,b)
    f_xk_z = f(xk_z)
   
    function [x,i] = bisection(a,b,eps)      
        i = 0;
        %100 - максимальное число итераций, взятое мной
        while ((b-a) > eps) && (i < 100)
            c = (a+b)/2;
            if(sign(f(a)) == sign(f(c)))
                a=c;
            else
                b=c;
            end
            i = i + 1;
            fprintf('%10s%15.7e%15s%15.7e\n',' c= ',c,' abs(f(c))= ',abs(f(c)))
        end
        x=a;
    %Здесь записано наше алгебраическое уравнение
    %function y = f(x)
    %   y = x^3 - 2*x^2 + 7*x + 3;
    %Здесь трансцендентное уравнение
    function y = f(x)
        y = exp(-x)-2;

          
            
    
    
    
    
