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
plot(X_A(1,:), X_A(2,:), 'b--', 'LineWidth', 2, 'DisplayName', 'Projektion (A)');
plot(X_B(1,:), X_B(2,:), 'r-', 'LineWidth', 2, 'DisplayName', 'Skalning (B)');
plot(X_C(1,:), X_C(2,:), 'g-', 'LineWidth', 2, 'DisplayName', 'Skjuvningen (C)');
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
title('Olika Avbildningar');
axis equal;

legend('show', 'Location', 'best');
hold off
