clear

X = [2 2 4 4 2 2 4 4 6 6 8 8 6 6 8 8 2;
     0 2 2 6 6 8 8 10 10 8 8 6 6 2 2 0 0 ];
% Våran Figur

A = [cosd(45)^2 sind(45)*cosd(45);
    sind(45)*cosd(45) sind(45)^2]
B = [0.8 0; 0 1.6]
C = [1 0; 0.6 1];
%avbildnings matriser 

X_A = A*X;
X_B = B*X;
X_C = C*X;
%Förändrade figurer

plot(X(1,:), X(2,:),'LineWidth', 2, 'DisplayName', 'Originala Figuren');
grid on
axis ("equal")
hold on 
xlim([-10 10])
ylim([-10 10])
plot(X_A(1,:), X_A(2,:), 'b-', 'LineWidth', 2, 'DisplayName', 'Projektion (A)');
plot(X_B(1,:), X_B(2,:), 'r--', 'LineWidth', 2, 'DisplayName', 'Skalning (B)');
plot(X_C(1,:), X_C(2,:), 'g-.', 'LineWidth', 2, 'DisplayName', 'Skjuvningen (C)');
% Ut Plottning för alla förändrade figurer

hold on

k = 1;
m = 0;
x = 0:0.1:15;
y = k * x + m;
% Y = KX + M

plot(x, y, 'm:', 'LineWidth', 1, 'DisplayName', 'Line: y = x');
grid on;
xlabel('x');
ylabel('y');
title('Olika Projektioner');
axis equal;

legend('show', 'Location', 'best');
hold off

%%
clear 
P1 = [1;-1];
P2 = [0; 1];
%
xlim([-10 10])
axis equal
grid on
%quiver(P1(1),P1(2),P2(1),P2(2),0)
v = 75;
x = linspace(-2,2)
k = tand(75);
y = k*x


plot(x,y)
X = [1;2];
A = [cosd(2*v) sind(2*v);
    sind(2*v) -cosd(2*v)];
Y = A*X;
drawArrow(P1,P2,"b")
%%
clear 
A = [0.8 0;0 1.6];
B = [0 0; 0 3; 3 3; 3 0; 0 0];
C = [1.25 0;0 0.625];
Y = B * A 
Z = B * C
oG = Y * Z
%plot(B(:,1),B(:,2))
plot(oG(:,1),B(:,2))
hold on
plot(Y(:,1),Y(:,2))
hold on
plot(Z(:,1),Z(:,2))
hold off

xlim([-10 10])
ylim([-10 10])
%%




function hArrow = drawArrow(p0,p1,color)
% drawArrow(p0,p1)
%
% Draws a simple arrow in 2D, from p0 to p1.
%
% INPUTS:
%   p0 = [x0; y0] = position of the tail
%   p1 = [x1; y1] = position of the tip
%   color = arrow color. Optional: default is black 
%       --> can be 'r','g','b','c','m','y','w', 'k' or a 1x3 color vector
%
% OUTPUTS:
%   hArrow = handle to the patch object representing the arrow
%

% Defaults:
if nargin == 2
   color = 'k'; 
end

% Parameters:
W1 = 0.08;   % half width of the arrow head, normalized by length of arrow
W2 = 0.014;  % half width of the arrow shaft
L1 = 0.18;   % Length of the arrow head, normalized by length of arrow
L2 = 0.13;  % Length of the arrow inset

% Unpack the tail and tip of the arrow
x0 = p0(1);
y0 = p0(2);
x1 = p1(1);
y1 = p1(2);

% Start by drawing an arrow from 0 to 1 on the x-axis
P = [...
    0, (1-L2), (1-L1), 1, (1-L1), (1-L2), 0;
    W2,    W2,     W1, 0,    -W1,    -W2, -W2];

% Scale,rotate, shift and plot:
dx = x1-x0;
dy = y1-y0;
Length = sqrt(dx*dx + dy*dy);
Angle = atan2(-dy,dx);
P = Length*P;   %Scale
P = [cos(Angle), sin(Angle); -sin(Angle), cos(Angle)]*P;  %Rotate
P = p0(:)*ones(1,7) + P;  %Shift

% Plot!
hArrow = patch(P(1,:), P(2,:),color);  axis equal;
hArrow.EdgeColor = color;

end

