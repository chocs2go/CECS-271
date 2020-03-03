% TASK #03 
%%   Anthony Paguio       %% 
%%   CECS 271 Fall 2019   %% 
%%   Task Assignment #03  %% 
%%   SEP 16 2019          %% 
close all; clear all; format compact; clc; disp(' '); 
disp('%%%%  Anthony Paguio       %%%%'); 
disp('%%%%  CECS 271 Fall 2019   %%%%'); 
disp('%%%%  Task Assignment #03  %%%%'); 
disp('%%%%  SEP 16 2019          %%%%'); 
disp(' '); 
disp('Task #03 -- Matlab Calculations'); 
str=datestr(now); 
disp(['Matlab Time Stamp: ',str]); disp(' '); 

%%  Task 3.1
disp('Task 3.1');
clear all; 
%task 3.1 
disp(' '); s = 0; for I = 1:100;     s = s + 1/I^2; end 
disp(['Required value of the summation is ' num2str(s)]) 
disp(' '); 

%% Task 3.2
disp('Task 3.2');
clear all; 
%task 3.2 
disp(' '); s = 0; for I = 1:2:100;     s = s + 1/I^2; end 
disp(['Required value of the summation is ' num2str(s)]) 
disp(' '); 

%% Task 3.4
disp('Task 3.4'); clear all; 
%task 3.4 disp(' '); 
disp(['Program which display the values of the function:']); 
 
disp(['    f(x) = x^2+1']); x =0:pi/4:pi; fn = x.^2+1; 
disp(['     values of x: { ',num2str(x),'  }']); disp(['function outputs: { ',num2str(fn),' }']); disp(' '); 

%% Task 3.5
disp('Task 3.5');clear all; 
%task 3.5 disp(' '); 
v = 0.:0.25:0.75; 
disp([' values of v: { ',num2str(v),' }']); 
cosx = zeros(size(v)); N = 10; range = 0:N; 
disp(['    N values: { ', num2str(N), ' }']); 
disp(['range values: { ', num2str(range), ' }']); ints =2*range; 
for n = range     
    cosx = cosx + (-1)^n*v.^ints(n+1)/factorial(ints(n+1)); 
end 
disp(['      output: {', num2str(cosx),' }']); 
disp(' '); 

%% Task 3.6
disp('Task 3.6');clear all; 
%task 3.6 disp(' '); 
s(1) = 1; 
disp(['       s value: ',num2str(s)]); 
for n = 1:2000 
    s(n+1) = s(n)+1/(n+1)^2; 
end 
disp([' s value (n+1): ', num2str(s)]); 
disp(' '); 

%% Task 3.7
disp('Task 3.7');clear all; 
%task 3.7 disp(' '); 
disp('Nested loop structure'); 
for p =1:4     
    sum = 0;   
end  
for j = 1:(p+1)         
    sum = sum + j^p;     
end 
disp([' sum for p=', int2str(p) ' is ' int2str(sum)]) 
disp(' ');

%% Task 3.8
disp('Task 3.8');clear all; 
%task 3.8 
disp(' '); 
sumln(1)= -1; 
for n = 1:1000 
    sumln(n+1) = sumln(n)+(-1)^(n+1)/(n+1);
end
disp([' first output:  {',num2str(sumln),'}']); 
sum2(1) = 1/2; 
for n = 1:1000 
    sum2(n+1) = sum2(n)+1/((n+1)*(n+2)); 
end 
disp([' second output: {',num2str(sum2),'}']); 
disp(' '); 

%% Task 3.9
disp('Task 3.9');clear all; 
%task 3.9 disp(' '); 
disp('logic expression: 2 < x < 4 '); 
disp(' x is greater than 2 and x is less than 4 '); 
disp('    ans: ~xor(x>=2, x=<4) '); 
disp(' '); 
disp('logic expression: for union {x > 3 and x < -1} '); 
disp(' x is greater than 3 and x is less than -1 '); disp('          for x = 1, 3, and 5'); disp('    ans: x > 3 "or" x < -1'); 
disp(' '); 

%% Task 3.10
disp('Task 3.10');clear all; 
%task 3.10 
disp(' '); 
n = 20:25; 
disp(['            value of n: ', num2str(n)]); 
m = (mod(n,2)==0 & n>20); 
disp(['list of logical output: ',num2str(m,'%4.0f')]); 
disp('          0:false       1:true'); disp(' '); 

%% Task 3.11
disp('Task 3.11');clear all; 
%task 3.11 
disp(' '); 
x = 1:3; 
disp(['x value: ', num2str(x)]); 
if(tan(73*pi*x/4) >= 0)     
    x = 2; 
else     
    x = pi;
end
if floor(x) == x     
    x = 10; 
else     
    x = 7;  
end
if isprime(x)     
    x = 'True'; else 
    x = 'False'; 
end
disp(['true until x = 3 ', x]); 
disp(' '); 

%% Task 3.12
disp('Task 3.12');clear all; 
%task 3.12 
disp(' '); 
s = 1/7; 
n = mod(5*s,1); 
while floor(n*7) ~= floor(s*7)     
    n = mod(5*n,1); end 
disp(['n: ', num2str(n)]); 
disp(' '); 

%% Task 3.13
disp('Task 3.13');clear all; 
%task 3.13 
disp(' '); 
n = 1:50; 
disp(['              values of n: { ',num2str(n),' }']); g = n.^3-n.^2+40; 
disp([' output of the polynomial: { ', int2str(g),' }']); ii = find(g > 1000 & mod(n,3) ~= 0); n(ii) 
disp(' '); 

%% Task 3.14
disp('Task 3.14');clear all; 
%task 3.14 
disp(' '); 
str = 'abcdefghij'; 
m = 'Enter an integer from 1 to 10: '; 
%n = input(m); 
n = 7; 
while (round(n)~=n) || (n<1 || n>10)     
    warning(' Not valid ')     
    n = input(m);  
str(1:n); 
disp(['input 7, then output is ',str]); 
disp(' '); 
end 



%% Task 3.16
disp('Task 3.16');clear all; 
%task 3.16 disp(' '); 
x = linspace(-3,5,100); 
for i = 1:length(x)     
    if x(i) >= -1 && x(i) <= 1         
        fs(i) = x(i)^2;     
    elseif x(i) > 1 && x(i) < 4         
        fs(i) = 1;     
    else         
        fs(i) = 0;   
    end   
end
plot(x,fs)
axis([-3 5 -0.5 1.5]) 
disp(' '); 

%% Task 3.17
disp('Task 3.17');clear all; 
%task 3.17 
disp(' '); 
x = -3:0.1:3; 
disp([' x values: { ', num2str(x)]); g = cos(pi*x); 
disp([' g values: { ', num2str(g)]); 
izero = find(abs(g)<=1e-15); 
ii = find(abs(g)>=1e-15); 
fa(izero)= NaN; 
fa(ii) = 1./g(ii); 
plot(x,fa) 
disp(' '); 

%% Task 3.18
disp('Task 3.18');clear all; 
%task 3.18 
disp(' '); 
x =linspace(-4,4); 
disp(['       x values: { ', num2str(x),' }']); N = length(x); 
disp(['        N value: { ', num2str(N),' }']); 
for j = 1:N 
    if x(j) >=0 && x(j) <= 1         
        fn(j) = x(j);     
    elseif x(j) >= 1 && x(j) < 2         
        fn(j) = 2 -x(j);     
    else
        fn(j) = 0;     
    end 
end
disp(['Function output: { ',num2str(fn) ,' }']); disp(' '); 
