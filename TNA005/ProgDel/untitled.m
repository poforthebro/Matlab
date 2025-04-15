% Uppgift 1
A = [1 2 -1 1;
    9 0 2 0;
    1 2 3 3;
    5 2 9 6] 
b = [0 2 -1 3]'
x = A\b
[A*x b]
%%
x = linspace(0,20);
y = -2+x+sin(x)
plot(x,y,'-x')
title('The function -2+x+sin(x)')
xlabel('x'), ylabel('y')
%%
fzero(@(x)-2+x+exp(-x),1.8)
%%
clear
%u = [1 0 0]';
%v = [0 1 2]';
%w = [0 0 2]';

volym = @(u,v,w) abs(dot(u,cross (v,w)))
V = volym(u,v,w)
%%syms x  implements x as a symbolic variable
%%
clear
for i = 20:70
    delbar = 0;
    for j = 2:i-1
        if mod(i,j) == 0
            delbar = delbar + 1;
        end
    end
    if delbar == 0
        disp(i)
    end
end
%%
clear

x = linspace(0,10,100)
f = @(x) x./ (1 + x);
g = @(x) x.^2./ (1 + (x.^2));
y1 = f(x);
y2 = g(x);
plot(x,y1)
hold on
plot(x,y2)
hold off
legend('f(x)','g(x)')
%%
clear 
load T.MAT
mean(T(1,152:181))
J = (T(1,152:181))
%%
clear i
%(1+i)/(2+3i)
%1+i/2+2*i
%(1+i)/(2+2*i)
%(1+i)/2+2*i
%%
log(2*3) 
log(2) + log(3)
log(2/3)
log(2) - log(3)
log(2^3)
3*log(2)
%%
a =3
b =2
exp(a+i*b)
exp(a)*exp(i*b)
exp(a)*(cos(b)+(i*sin(b)))
%%
a = 2
k = 3.6
a = a*k
k = a/k^2
%%
k = 11
a = k/2
k = (k-1)/3
a = 0.5*a
%%
k = 2
a = 1
a = a*k+9
a = a*k-4
a = a*k-16
%%
%test.m
x = input('ange ett värde på ')
y=sqrt(x)
disp('roten av x-värdet är ')
disp(y)
%%
%% 
sin = 0.5
clear sin
sin(pi/2)
%%
x = [-1 -2 0 1 3 4 6 ], x([1 4 5]) = []
%%
x = 1:10, x(1:2:9) = []
%%
%%
u = floor(6*rand(1,100000));
umedel = mean(u)
%%
U = rand(4,3);
reshape (U,6,2);
reshape (U,1,12);
%%
clear
A1(1,1) = 1;
A1(1,2) = 3;
A1(1,3) = 2;

A1(2,1) = 4;
A1(2,2) = -5;
A1(2,3) = 6;

A1(3,1) = 0;
A1(3,2) = 1;
A1(3,3) = 2;
% 2nd dimension
A2(1,1) = 2;
A2(1,2) = 1;
A2(1,3) = 0;

A2(2,1) = 3;
A2(2,2) = 8;
A2(2,3) = -4;

A2(3,1) = 1;
A2(3,2) = 6;
A2(3,3) = 0;
A = zeros(3,3,2)
A(:,:,1) = A1
A(:,:,2) = A2
%%
clear
m = input('vektor sizes= ');
for i= 1:1
    for j=1:m
    a(i,j)= input('elements for vektor 1= ');
    v=[a]
    end
    for j=1:m
    a(i,j)= input('elements for vektor 2= ');
    u=[a]
    end
end
lu = sqrt(dot(u,u))
lv = sqrt(dot(v,v))
scalar = sum(u.*v)
angle = acos(scalar/(lu*lv))

%%
clear 
load T.MAT
[maxjuni,ar] = max(max(T(:,152:181)')) % första max tar max för alla juni som fanns
%andra max tar från alla juni totalt, ar sparas som År det hände,
%positionen och maxjuni sparas som värdet
mean(T(1,152:181))
disp('max temp under juni')
disp(maxjuni)
disp('år')
disp(ar + 1980)
S = T(1:5,:); 
mean1_5 = mean(S(:))
S = T(6:10,:); 
mean6_10 = mean(S(:))
S = T(1:5,152:181); 
mean1_5_juni = mean(S(:))
S = T(6:10,152:181); 
mean6_10_juni = mean(S(:))
J = (T(1,152:181))
%%
%for k=1:T(end)
 %   d(k) = T1(k+1)-T1(k);
%end
clear 
load T.MAT
T1 = T(1,:)
d = T1(2:end) - T1(1:end-1)
figure(1)
plot(d,'-x')
grid on
[d1,k2] = max(d)
[d2,k2] = min(d)
d2 = abs(d2)
%c)
E = zeros(1,10)
for i=1:10
    Ti = T(i,:); 
    di = Ti(2:end) - Ti(1:end-1);
    E(i) = max(di);
end
[year,d3] = E
%%
clear
x = 3 
n = 10
e = minExp(x,n)
%b
E2 = zeros(10,1);
for f = 1:10
    E2(f) = minExp(2,f)
end 

D = abs(E2-exp(2));
disp(D)

%%
clear
f = @(x) sin(x).*sin(x)
x = linspace(-2*pi,2*pi,300);
y = f(x)

h = 0.001;
yp = (f(x+h) -f(x))/h

plot (x,yp)
hold on
%%

fp = @(x) 2*sin(x).*cos(x)
yp2 = fp(x)
plot (x,yp2)
hold off

d = abs(yp-yp2);
s = sum(d)


%% 
t = 1:12;
N = [97 709 2698 6928 15242 29944 52902 83903 120612 161711 206247 257085];
figure(1), plot(t,N,'+')
figure(2), loglog(t,N,'+')
figure(3), semilogy(t,N,'+')

%%
clear 
t = 0:2:14;
N = [2 5 10 20 40 109 200 403];
figure(1), plot(t,N,'+')
figure(2), loglog(t,N,'+')
figure(3), semilogy(t,N,'+')

%% 
clear

A = imread("Cute-Cat.jpg") 
imagesc(A)


%%
clear
f1 = @(x) exp(-(x+5).^2)
f2 = @(x) 2*exp(-(x-5).^2)
x = linspace(-10, 10);
plot(x,f1(x) + f2(x))
axis([-10 10 -1 4])
M = moviein(101);
for k = 1:101
    t = 0.1*(k-1);
    plot(x,f1(x-t)+f2(x+t))
    axis([-10 10 -1 4])
    M(:,k) = getframe;
end
movie(M,10)
vidobj = VideoWriter('cute_graph.avi');
open(vidobj);
writeVideo(vidobj,M);
close(vidobj);
%%
g = @(x) (x.^2)./(1+x.^2)
f = @(x) (x)./(1+x)
x = linspace(0,10,200)
plot (x,f(x),"g--") 
hold on
plot (x,g(x),"b")
hold off
y1 = f(x);
y2 = g(x);
%%
clear
load befolkningUSA.mat 
figure(1); plot(ar, befolkning,'o');
hold on;
b_func = @(t) 197273000 ./(1 + exp((-0.03134) * (t - 1913.25)))
t = linspace(1790,1960,100)
N = b_func(t);
plot(t,N,'r');
xlabel('År');
ylabel('Befolkningsstorlek');
title('USAs befolkningsutveckling')
%%
clear
x1 = [-1 -0.5 0 0.5 1 1.5 2]
y1 = zeros(1,length(x1))
x2 = linspace(-2,3,200)
for i = 1:length(x1)
y1(i) = rektangelpuls(x1(i))

end

for i = 1:length(x2)
y2(i) = rektangelpuls(x2(i))

end
disp(x1)
disp(y1)
plot(x2,y2)

%%
clear
load T.MAT

nMinusGrader = sum(T < 0,2)
MedelMinusGrader = mean(nMinusGrader)
n0_10Grader = sum(0 <= T & T <= 10,2)  
%%
clear 
for i = 1:6
    for j = 1:6 
        A(i,j) = 0+i^(j-1)
    end
end

%%
clear
for i = 1:30
    for j = 1:30 
        A(i,j) = i+j
    end
end

[n,n] = size(A)
s = 0
for i = 2:n-1 
    s = s + A(i,i) + A(i,i-1) + A(i,i+1) 
end
    s = s + A(1,1) + A(1,2) + A(n,n-1) + A(n,n) 

%%
clear
t = linspace(-pi,pi,300)
n1 = 2;
n2 = 5;
n3 = 10;
n4 = 20;
S2 = approximerapuls(t,n1) 
S5 = approximerapuls(t,n2)
S10 = approximerapuls(t,n3)
S20 = approximerapuls(t,n4)

plot(t,S2)
subplot(2,2,1)
plot(t,S5)
subplot(2,2,2)
plot(t,S10)
subplot(2,2,3)
plot(t,S20)
subplot(2,2,4)


function y = rektangelpuls(x)
if x > 1 | x <= 0
    y = 0;
else 
    y = 1;
end
disp(y)
end
%%
clear
f = @(x) 1./(1+2*x.^2);
x = linspace(0,pi,100);
y = f(x);
plot(x,y,'b-')
xlabel('x');
ylabel("f(x)");
title("Plot of f(x) = 1 / (1+ 2x^2)");
grid on;
integral = stapelarea(f,0,pi,100);
n = 10;
I10 = stapelarea(f,0,pi,n);
I = atan(sqrt(2)*pi)/sqrt(2);
DI = abs(I-I10);
DI_n = DI;
while DI_n >= 1e-5
    n = n + 1;
    I_n = stapelarea(f,0,pi,n);
    DI_n = abs(I - I_n);
end
disp(DI_n)
disp(n)