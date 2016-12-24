function notExplicitScheme
format short e
a=0;% начало промежутка по x
b=1;% конец промежутка по x
t0=0;% начало промежутка по t
tn=1;% конец промежутка по t
 
f=@(x,t)(4*pi^2-1)*exp(-t)*sin(2*pi*x);% функция для вычисления выражения без частных производных
n_x=10;% количество промежутков по x
n_t=n_x^2;% количество промежутков по t
h_x=(b-a)/n_x;% шаг по x
h_t=(tn-t0)/n_t;% шаг по t

x=a:h_x:b;
    u_x_0=sin(2*pi*x);
  t=t0:h_t:tn;
    u_0_t=0;
    u_1_t=0;  
u_exact=zeros(n_t+1,n_x+1);
    for i=1:n_t+1;
      t(i)=t0+(i-1)*h_t;
      for j=1:n_x+1;
        x(j)=a+(j-1)*h_x;
        u_exact(i,j)=sin(2*pi*x(j))*exp(-t(i));
      end
    end
u=zeros(n_t+1,n_x+1);
    u(1,:)=u_x_0;
    u(:,1)=u_0_t;
    u(:,n_x+1)=u_1_t';
k=h_t/(h_x*h_x);
A=sparse(1:n_x-1,1:n_x-1,k+1)+sparse(2:n_x-1,1:n_x-2,-0.5*k,n_x-1,n_x-1)+sparse(1:n_x-2,2:n_x-1,-0.5*k,n_x-1,n_x-1);
    for it=2:n_t+1;
     for i=1:n_x-1;
       b(i)=0.5*k*(u(it-1,i+2)+u(it-1,i))+(1-k)*u(it-1,i+1)+h_t*f(x(i+1),t(it-1)+h_t/2);
     end
     b(1)=b(1)+0.5*k*u(it,1);
     b(n_x-1)=b(n_x-1)+0.5*k*u(it,n_x+1);
     c=A\b';
     u(it,2:n_x)=c';
    end
eps1=max(abs(u-u_exact));
eps=max(eps1);
H   = [0.1 0.05 0.025 0.01 0.005 0.0025 0.001 0.0008 0.0005 0.0001];
Eps = [2.8958e-002 7.5076e-003 3.3105e-003 1.8708e-003 1.1945e-003 8.3099e-004 6.0983e-004 4.6733e-004 3.6901e-004 2.9906e-004]; 
 
    
    %plot(H,Eps)
    %loglog(H,Eps)
    %title('График зависимости ошибки eps от шага h')
    %xlabel('Шаг h')
    %ylabel('Ошибка eps')
    %grid on
    
     x1 = 0 : 0.001 : 1;
     u_exact1= @(x1,t_slice)sin(2*pi*x1)*exp(-t_slice);%время, на котором мы рассматриваем срез
     
     t1 = 1;
     subplot(2,2,1),plot(x,u(t1,:),x1,u_exact1(x1,0))
     title('Срез при t = 0')
     xlabel('X')
     ylabel('U')
     grid on
     
    t2 = 0.25*n_t;
    subplot(2,2,2),plot(x,u(t2,:),x1,u_exact1(x1,0.25))
    title('Срез при t = 0.25')
    xlabel('X')
    ylabel('U')
    grid on
    
    t3 = 0.5*n_t + 1;
     subplot(2,2,3),plot(x,u(t3,:),x1,u_exact1(x1,0.5))     %title('Срез при t = 0.5')
     title('Срез при t = 0.5')
     xlabel('X')
     ylabel('U')
     grid on
        
     t4 = 0.75*n_t + 1;
     subplot(2,2,4),plot(x,u(t4,:),x1,u_exact1(x1,0.75))
     title('Срез при t = 0.75')
     xlabel('X')
     ylabel('U')
     grid on