%%Task 4.1%%
disp(' '); 
disp('Problem 4.1.1 -- Fixed Point Method');
f = @(x) 2*sin(sqrt(x));
fpt = @(x) 2*sin(sqrt(x))-x;
x = 0:0.01:4;
plot(x,fpt(x)); grid on;
%f = @(x) (asin(x/2))^2; -- does not converge
x0 = 1/2; %initial guess of 5
iters = 0;
tolerance = 1e-5;
err = 1;
%disp(['x(',num2str(iters),')=',num2str(x0)]);
while(iters<=100 && err>tolerance)
    iters = iters + 1;
    x1 = f(x0);
    disp([' Iteration = ', num2str(iters), 'x0 = ',num2str(x0), 'x1 = ', num2str(x1)]);
    err = abs((x1-x0)/x1);
    x0 = x1;
end
disp([' f(x) = 0 for x = ', num2str(x1)]);


%%Task 4.1.2
disp(' ');
disp('Problem 4.1.2 -- Newton-Raphson Method');
%use anonymous function
g = @(x) 0.0074*x.^4 -0.284*x.^3+3.355*x.^2 -12.183*x +5;
gprime = @(x) 4*0.0074*x.^3 -3*0.284*x.^2 +2*3.355*x.^1 -12.183;
disp('  First try at x0=16.15');
x0=0; x1=16.15; %Initial guess leads to not sought after root!
x=0:0.001:20; figure(); plot(x,g(x),'b',x,x*0,'r--'); title('Problem4.1.2'); grid on;
iters=0; tolerance=1e-5; err=1;
disp(['x(',num2str(iters),')=',num2str(x1)]);
while(iters<=100 && err>tolerance)
    iters=iters+1;
    x0=x1; %Update guessh=-g(x0)/gprime(x0);
    x1=x0+h;
    err=abs((x1-x0)/x1);
    disp(['x(',num2str(iters),')=',num2str(x1)]);
end
disp('Root is not between 15 and 20!');
%Repeat process with another initial guess close to root
disp('  Second try at x0=17');
x1=17;
iters=0; tolerance=1e-5; err=1;
disp(['x(',num2str(iters),')=',num2str(x1)]);
while(iters<=100 && err>tolerance)
    iters=iters+1;
    x0=x1; %Update guess
    h=-g(x0)/gprime(x0);
    x1=x0+h;
    err=abs((x1-x0)/x1);
    disp(['x(',num2str(iters),')=',num2str(x1)]);
end
disp('Found the root that is between 15 and 20');
x=0:0.001:20; figure(); plot(x,g(x),'b',x,x*0,'r--',x1,0,'ko');
text(x1-3.5,1,'Desired root');
title('Problem 4.1.2'); grid on;

%%Task 4.1.3
disp(' ');
disp('Problem 4.1.3 --Bisection Method');
Volume=3;R=0.518; %Universal gas constant
pc=4580; Tc=191;
a=0.427*R^2*Tc^(2.5)/pc;
b=0.0866*R*Tc/pc;
T=-50+273.15; p=65000;
f=@(v) (R*T)./(v-b)-a./(v.*(v+b).*sqrt(T))-p;

figure(); v=0.0017:0.2e-4:0.002; plot(v,f(v),'b',v,v*0,'r--');
legend('f(v)','f(v)=0'); xlabel('v'); title('Problem 4.1.3');
%Observe that root lies between 0.0018 and 0.00195 so use bisection:
va=1.8e-3; vb=1.95e-3; format long;
maxits=100; tolerance=1e-12;
iflag = 0;
iterations =0;
f_a = f(va);
f_b = f(vb); err=1;
while((f_a*f_b<0) & iterations<maxits) & err>tolerance
    iterations = iterations +1;
    vc = (vb+va)/2;
    err=abs((vc-va)/vc);
    f_c = f(vc);
    if f_c*f_a<0
        err=abs((vc-vb)/vc);
        vb=vc; f_b = f_c;
    elseif f_b*f_c<0
        err=abs((vc-va)/vc);
        va=vc; f_a = f_c;
    else
        iflag = 1; answer = vc;
            err=0;
    end
end
v=vc;
M=Volume/v;
disp(['f(v)=0 at v=',num2str(vc),' m^3/kg']);
disp(['Mass of methane in tank M=',num2str(M),' kg']);

formatshort;
