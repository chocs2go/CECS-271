%% %%   Anthony Paguio       %%
%% %%   CECS 271 Fall 2019   %%
%% %%   Final Lab Exam       %%
%% %%   11 DEC 2019          %%
%% %%
close all; clear all; format compact; clc;
disp(' ');
disp('%%%%  Anthony Paguio       %%%%');
disp('%%%%  CECS 271 Fall 2019   %%%%');
disp('%%%%  Final Exam - Lab     %%%%');
disp('%%%%  11 DEC 2019          %%%%');
disp(' ');
disp('Final Exam - Lab  ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp(' ');


%% Problem 1
close all; clear all; format compact; clc;
disp('Problem 1');
disp(' ');

iters=0;
maxits =30; tolerance=0.0001;
x0=0; x1=0.5;
while (iters<maxits && abs((x1-x0)/x1)> tolerance)
    iters=iters+1;
    x0=x1;
    x1 = (2*sin(sqrt(x0)));
    err=abs((x1-x0)/x1);
    disp(['Iteration=',num2str(iters),' x0=', num2str(x0),...
        '   x1=', num2str(x1),' err=',num2str(err)]);
end
disp([' x=', num2str(x1), ' is a root']);
disp(' ');


%% Problem 2
close all; clear all; format compact; clc;
disp('Problem 2');
disp(' ');
iters=0;
maxits =30; tolerance=0.0001;
x0=15; x1=30;
f_x0 = fun2(x0);
f_x1 = fun2(x1);

while (iters<maxits && abs((x1-x0)/x1)> tolerance)
    iters=iters+1;
    
    x2 = (x1+x0)/2;
    f_x2 = fun2(x2);
    
    if f_x2*f_x0<0
        x1 = x2; f_x1 = f_x2;
    elseif f_x1*f_x2<0
        x0 = x2; f_x0 = f_x2;
    else
       x1 = x2;
       x0 = x2;
    end
     
    err=abs((x1-x0)/x1);
    disp(['Iteration=',num2str(iters),' x0=', num2str(x0),...
        ' x1=', num2str(x1),' x2=', num2str(x1),' err=',num2str(err)]);
end
disp([' x=', num2str(x2), ' is a root']);
disp(' ');


%% Problem 3
close all; clear all; format compact; clc;
disp('Problem 3');
disp(' ');
Pt=3;
f=@(x) (x/(1-x))*(sqrt(2*Pt/(2+x)));
fp=@(x) 6^(1/2)*x*(1/(x + 2))^(1/2)/(x - 1)^2 - (6^(1/2)*(1/(x + 2))^(1/2))/(x - 1) + (6^(1/2)*x)/(2*(1/(x + 2))^(1/2)*(x - 1)*(x + 2)^2);
iters=0;
maxits =30; tolerance=0.0001;
x0=0.05; x1=0.06;
while (iters<maxits && abs((x1-x0)/x1)> tolerance)
    iters=iters+1;
    x0=x1;
    h= -f(x0)/fp(x0);
    x1 = x0+h;
    x1=x0+h;
    
    err=abs((x1-x0)/x1);
    disp(['Iteration=',num2str(iters),' x0=', num2str(x0),...
        '  x1=', num2str(x1),' err=',num2str(err)]);
end

f=@(x) 0.05 -x.*sqrt(6./(2+x))./(1-x);
x=-1:0.1:1;
plot(x, f(x), 'b',x,0*x, 'r--');
legend('f(x)', 'y=0');
disp(['the value of x that satisfies the equation for K is ',num2str(fzero(f,0))]);

disp(' ');


%% Problem 4
close all; clear all; format short; clc;
disp('Problem 4');
disp(' ');
syms AB BC AD BD CD DE CE Ax Ay Ey 
x1=Ax+AD==0; % Equation 1
x2=Ay+AB==0; % Equation 2
x3=74+BC+(3/5)*BD==0; % Equation 3
x4=-AB-(4/5)*BD==0; % Equation 4
x5=-BC+(3/5)*CE==0; % Equation 5
x6=-24-CD-(4/5)*CE==0; % Equation 6
x7=-AD+DE-(3/5)*BD==0; % Equation 7
x8=CD+(4/5)*BD==0; % Equation 8
x9=-DE-(3/5)*CE==0; % Equation 9
x10=Ey+(4/5)*CE==0; % Equation 10
[data_out]=solve(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10);
fprintf('AB = %f \nBC = %f \nAD = %f \nBD = %f \nCD = %f \nDE = %f \nCE = %f \nAx = %f \nAy = %f \nEy = %f \n',double(data_out.AB),double(data_out.BC),double(data_out.AD ),double(data_out.BD ),double(data_out.CD ),double(data_out.DE ),double(data_out.CE ),double(data_out.Ax ),double(data_out.Ay ),double(data_out.Ey));
disp(' ');


%% Problem 5
close all; clear all; format compact; clc;
disp('Problem 5');
disp(' ');

x = [-2   -1   -0.5   0.5   1  2]; %x plane
y = [-637  -96.5  -20.5 20.5  96.5  637 ]; %y plane
z = 0.10; 
A = Lagrangeint(x,y,z); 
disp(['V for i=0.10 is ',num2str(A)]);
disp(' ');


%% Problem 6
close all; clear all; format compact; clc;
disp('Problem 6');
disp(' ');
f=@(x) 200*(x/(7+x))*exp((-2.5*x)/30); 
 a=0;
 b=30;
 n= 4; % exmple n=16
 h=(b-a)/n;
if rem(n,2)==1
   fprintf('\n Enter valid n!!!'); 
   n=input('\n Enter n as even number ');
end
for k=1:1:n
  x(k)=a+k*h;
  y(k)=f(x(k));
end
 so=0;se=0;
for k=1:1:n-1
    if rem(k,2)==1
       so=so+y(k);
     else
       se=se+y(k); 
    end
end
answer=h/3*(f(a)+f(b)+4*so+2*se);
fprintf('\n The value of integration is %f',answer); 
disp(' ');


%% Problem 7
close all; clear all; format compact; clc;
disp('Problem 7');
disp(' ');
n = 1:4;
x = linspace(-pi,pi,4);
Ca = ((-1).^n).*(4./(n.^2));
Cj = conj(Ca);
disp(['Real Part      ',num2str(Ca)]);
disp(['Imaginary Part ',num2str(Ca)]);

summ = ((-1).^n).*(cos(n.*x)./(n.^2));
f = @(x) ((pi^2/3)+ 4.*sum((((-1).^n).*(cos(n.'.*x)))./(n.^2)));

disp(' ');


%% Problem 8
close all; clear all; format compact; clc;
disp('Problem 8');
disp(' ');

hold on
N=100000;
x=zeros(1,N);
y1=0;
x1=0;
for a=2:N
c=randi([0 2]);
switch c
    case 0
        x1(a)=0.5*x1(a-1);
        y1(a)=0.5*y1(a-1);
    case 1
        x1(a)=0.5*x1(a-1)+.25;
        y1(a)=0.5*y1(a-1)+sqrt(3)/4;
    case 2
        x1(a)=0.5*x1(a-1)+.5;
        y1(a)=0.5*y1(a-1);
end
end
plot(x1,y1,'k^')
title('Sierpinski’s triangle fractal')
legend(sprintf('N=%d Iterations',N))

disp(' ');


%% Problem 9
close all; clear all; clc;
disp('Problem 9');
disp(' ');
disp('Problem 9 (a)'); clear all;
a=1;
n=1:1:10;
r=(-3/5);
S=a*r.^(n-1);
disp(['sum S of the first 10 terms ',num2str(sum(S))]);
disp(' ');
disp('Problem 9 (b)'); clear all;
x=linspace(0,1);
f=@(x) x/(1+x.^2);
g=@(x) tan(x);

Q=f(g(x))*g(f(x))'
disp(' ');
disp('Problem 9 (c)'); clear all;
x=[4,-12,6,-2,6,5,7,10,0,-1,-8,9,4,3,9,-4,11,8,-6,5];
n=length(x);

% sorted manually x = [-12 -8 -6 -4 -2 -1 0 3 4 4 5 5 6 6 7 8 9 9 10 11];
median=(4+5)/2; %middle 2 add them and divide by 2.

mean = (sum(x))/length(x);
x0 = ((x - mean).^2)/(n-1);
x1 = sum(x0);

disp(['    mean of x is ', num2str(mean)]);
disp(['  median of x is ', num2str(median)]);
disp(['variance of x is ', num2str(x1)]);
disp(' ');
disp('Problem 9 (d)'); clear all;
disp(' ');
t = linspace(-pi,pi,100);
f = (t.^2.*sin(4.*t))/(9);
y = 1 - exp(-3*cos(5.*t).^3);
co = corrcoef(f,y);
disp(['The correlation of x and y = ' num2str(co(2 ))]);
disp(' ');


%% functions
function [f] = fun2(x)
  A=30; L=150; B=40;
    
  f = (A*B*L/4)*(acos(1-(2*x)/A)-(1-(2*x)/A)*sqrt((4*x/A)-(4*x^2)/A^2));
end
function [f] = fun3(x)
  f = x.^4*sin(x)+x.^2-x;
end
function Z = Lagrangeint(x,y,xp) 
n = length(x)-1;
Q = 0;
for i = 1 : n+1 
   P = 1;
    for j = 1 : n+1
        if j ~= i
            P = P * (xp - x(j))/(x(i) - x(j));
        end
    end
    Q = Q + y(i) * P;
end
Z = Q;
end
