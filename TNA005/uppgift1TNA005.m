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
k = 1;
m = 0;
x = 0:0.1:15;
y = k * x + m;
% Y = KX + M


%Förändrade figurer

grid on
axis ("equal")
figure(1)
plot(X_A(1,:), X_A(2,:), 'b--', 'LineWidth', 2, 'DisplayName', 'Projektion (A)');
hold on
plot(X(1,:), X(2,:),'LineWidth', 2, 'DisplayName', 'Originala Figuren');
plot(x, y, 'm:', 'LineWidth', 1, 'DisplayName', 'Line: y = x');
grid on
title('Projektion på linje');
xlim([-1 20])
ylim([-1 20])
legend('show', 'Location', 'best');
figure(2)
plot(X_B(1,:), X_B(2,:), 'r-', 'LineWidth', 2, 'DisplayName', 'Skalning (B)');
grid on
xlim([-1 20])
ylim([-1 20])
title('Skalning');
legend('show', 'Location', 'best');
figure(3)
plot(X_C(1,:), X_C(2,:), 'g-', 'LineWidth', 2, 'DisplayName', 'Skjuvningen (C)');
% Ut Plottning för alla förändrade figurer



xlim([-1 20])
ylim([-1 20])
grid on;
xlabel('x');
ylabel('y');
title('Skjuvning');



legend('show', 'Location', 'best');
hold off
