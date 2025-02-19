% figur 1 nollrum och värderum

clear
u = [2;5]
v = [-5;-2]
w = [-4;4]
% uvw



A = [cosd(45)^2 sind(45)*cosd(45);
    sind(45)*cosd(45) sind(45)^2]
FAu = A * u
FAv = A * v
FAw = A * w
% Applicerad A på uvw
k = 1;
m = 0;
x = -10:0.1:10;
y = k * x + m;
y_normal = (-1/k)*x + m;

% Y = KX + M
% { 
grid on
plot([0, u(1)], [0, u(2)], 'b-', 'LineWidth', 2, 'DisplayName', 'Vector u');
hold on
plot([0, v(1)], [0, v(2)], 'r-', 'LineWidth', 2, 'DisplayName', 'Vector v');
plot([0, w(1)], [0, w(2)], 'g-', 'LineWidth', 3, 'DisplayName', 'Vector v');
% u o v
%plot(u(1,:), u(2,:),'LineWidth', 2, 'DisplayName', 'Originala Figuren');???

plot([0, FAu(1)], [0, FAu(2)], 'b--', 'LineWidth', 2, 'DisplayName', 'Vector u');
plot([0, FAv(1)], [0, FAv(2)], 'r--', 'LineWidth', 2, 'DisplayName', 'Vector u');
plot([0, FAw(1)], [0, FAw(2)], 'g--', 'LineWidth', 3, 'DisplayName', 'Vector u');
% vector u o v projecerad

plot(x, y_normal, 'LineWidth', 2, 'DisplayName', 'Line: normalen till y = x');
% normalen till projecerings linje
plot(x, y, 'm:', 'LineWidth', 1, 'DisplayName', 'Line: y = x');

%}
    xlim([-10 10])
    ylim([-10 10])
    % Limiteringar höjt upp
    grid on;
    axis ("equal")
    xlabel('x');
    ylabel('y');
    % Customize the graph
numFrames = 50;
for t = linspace(0, 1, numFrames)
    current_u = (1 - t) * u + t * FAu;
    current_v = (1 - t) * v + t * FAv;
    current_w = (1 - t) * w + t * FAw;
    cla;
    plot(x, y, 'm:', 'LineWidth', 1, 'DisplayName', 'y = x');
    plot(x, y_normal, 'LineWidth', 2, 'DisplayName', 'normalen till y = x');

    quiver(0, 0, u(1), u(2), 'b-', 'LineWidth', 2, 'DisplayName', 'Vektor u');
    quiver(0, 0, v(1), v(2), 'r-', 'LineWidth', 2, 'DisplayName', 'Vektor v');
    quiver(0, 0, w(1), w(2), 'g-', 'LineWidth', 2, 'DisplayName', 'Vektor w');
    quiver(0, 0, FAu(1), FAu(2), 'b--', 'LineWidth', 2, 'DisplayName', 'Projekterad Vector u');
    quiver(0, 0, FAv(1), FAv(2), 'r--', 'LineWidth', 2, 'DisplayName', 'Projekterad Vector v');
    quiver(0, 0, FAw(1), FAw(2), 'g--', 'LineWidth', 2, 'DisplayName', 'Projekterad Vector w');
    quiver(0, 0, current_u(1), current_u(2), 'b--', 'LineWidth', 2, 'DisplayName', 'Anim Vektor u');
    quiver(0, 0, current_v(1), current_v(2), 'r--', 'LineWidth', 2, 'DisplayName', 'Anim Vektor v');
    quiver(0, 0, current_w(1), current_w(2), 'black--', 'LineWidth', 2, 'DisplayName', 'Anim Vektor w');
    % Update the plot
    drawnow;
end
title("Projektion av vektorer")
hold off;
legend show;
% projecerings linjen



%%
% figur 2 egenvärde och egenvektor med skjuvning
clear;
u = [2;5];
v = [2;0];
w = [0;5];
z = [0;-5];
C = [1 0; 0.6 1];
FCu = C * u;
FCv = C * v;
FCw = C * w;
FCz = C * z;

plot([0, u(1)], [0, u(2)], 'b-', 'LineWidth', 2, 'DisplayName', 'Vektor u');
hold on
plot([0, v(1)], [0, v(2)], 'r-', 'LineWidth', 2, 'DisplayName', 'Vektor v');
plot([0, w(1)], [0, w(2)], 'g-', 'LineWidth', 2, 'DisplayName', 'Vektor w');
plot([0, z(1)], [0, z(2)], 'black-', 'LineWidth', 2, 'DisplayName', 'Vektor z');

plot([0, FCu(1)], [0, FCu(2)], 'b--', 'LineWidth', 2, 'DisplayName', 'Skjuvad u');
plot([0, FCv(1)], [0, FCv(2)], 'r--', 'LineWidth', 2, 'DisplayName', 'Skjuvad v');
plot([0, FCw(1)], [0, FCw(2)], 'g--', 'LineWidth', 2, 'DisplayName', 'Skjuvad w');
plot([0, FCz(1)], [0, FCz(2)], 'black--', 'LineWidth', 2, 'DisplayName', 'Skjuvad z');

grid on
xlabel('x');
ylabel('y');
xlim([-6 10])
ylim([-6 10])
title("Egenvärde med Skjuvning")
text(u(1), u(2), '  Original u', 'Color', 'b');
text(FCu(1), FCu(2), '  Skjuvad u', 'Color', 'b');
text(v(1), v(2), '  Original v', 'Color', 'r');
text(FCv(1), FCv(2), '  Skjuvad v', 'Color', 'r');
text(w(1), w(2), '  Original w', 'Color', 'g');
text(FCw(1), FCw(2) + 0.5, '↓ Skjuvad w (lambda = 1)', 'Color', 'g');
text(z(1), z(2), '  Original z', 'Color', 'black');
text(FCz(1), FCz(2) - 0.5, '↑ Skjuvad z (lambda fortfarande = 1)', 'Color', 'black');
hold off
%%
% figur 3  invers
X = [2 2 4 4 2 2 4 4 6 6 8 8 6 6 8 8 2;
     0 2 2 6 6 8 8 10 10 8 8 6 6 2 2 0 0 ];

B = [0.8 0; 0 1.6]

A = B*X;


plot(A(1,:),A(2,:))
hold on

grid on

org = [1.25 0; 0 0.625]*A

plot(org(1,:),org(2,:))
legend ("Skalad","Original = FB^{-1}(Skalad)");
title ("Invers på objekt")
xlim([-1 20])
ylim([-1 20])
hold off
%%
%figur 4  determinant
clear
X = [2 2 4 4 2 2 4 4 6 6 8 8 6 6 8 8 2;
     0 2 2 6 6 8 8 10 10 8 8 6 6 2 2 0 0 ];

C = [1 0; 0.6 1];
det_C = det(C)
disp(det_C)
A = C*X;

plot(X(1,:),X(2,:))
hold on

plot(A(1,:),A(2,:))
hold off
xlim([-1 15])
ylim([-1 15])
legend ("Original", "Skjuvad");
title ("Skjuvning på objekt, det = 1")
xlabel('x');
ylabel('y');
grid on
%%
%figur 5 sammansatt avbildning

X = [2 2 4 4 2 2 4 4 6 6 8 8 6 6 8 8 2;
     0 2 2 6 6 8 8 10 10 8 8 6 6 2 2 0 0 ];

B = [0.8 0; 0 1.6]

C = [1 0; 0.6 1];

CB = C*B;
BC = B*C;

A = C*X;

plot(X(1,:),X(2,:))
hold on

D = B*X

BC1= BC*X
CB1= CB*X

plot(BC1(1,:),BC1(2,:))
plot(CB1(1,:),CB1(2,:))
grid on
title ("Sammansatt avbildning")
legend('original', 'skalad sen skjuvad', 'skjuvad sen skalad')
xlim([-1 22])
ylim([-1 22])
hold off

