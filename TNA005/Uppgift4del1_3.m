clear
k = 200;
t = linspace(0,pi,k);
x = sin(t).*cos(8*t);
y = sin(t).*sin(8*t);
z = cos(t) + 2;
X = [x;y;z];
% Definerar en figur i 3D


plot3(X(1,:),X(2,:),X(3,:),"-x")
hold on
grid on
axis equal
%Plottar originala figuren, inställningar
drawCAxis()
%Gör Koordinater

P0 = [0,0,0]';
n = [0.2 0.8 1.4]';
L = n*(-2:3)
drawArrow3(P0,n)
% Gör en punkt och sen peka den mot normalen ,gångra den med defnitioner
% för -2:3 och bildar en linje för normalen


v = deg2rad(225);

%P = Matrixproj3(n) * X;
% Projektionens Matris
R1 = matrixRot3(n,v) * X;
% Rotationens Matris
%PR2 = Matrixproj3(n)* matrixRot3(n,v)* X;
%Först Projektion, sen Rotation
drawPlane(n)
% Planen 


plot3(L(1,:),L(2,:),L(3,:))
%plot3(P(1,:),P(2,:),P(3,:))
plot3(R1(1,:),R1(2,:),R1(3,:))
%plot3(PR2(1,:),PR2(2,:),PR2(3,:))
%Alla Plottar i 3D
xlabel('x')
ylabel('y')
zlabel('z')
title('projektion och rotation')
legend('original', 'X', 'Y', 'Z', 'normalvektor', 'plan', 'normal', 'rotation', 'rotation', 'projektion på rotation')
 

%%
%{
v = deg2rad(225)
B = matrixRot3(n,v)
Z = B*X;
plot3(Z(1,:),Z(2,:),Z(3,:))
hold on 
plot3(X(1,:),X(2,:),X(3,:))
%}
function drawCAxis()
% Draw arrows for the 3D coordinate axis. 
% Try: 
% drawCAxis()

p0 = [0;0;0];
x = [1;0;0];
y = [0;1;0];
z = [0;0;1];


drawArrow3(p0,x)
drawArrow3(p0,y)
drawArrow3(p0,z)

end
function drawArrow3(P1,P2,color)
% Draw an arrow from point P1 to P2. 
% P1: x-, y- and z-coordinate for starting point
% P2: x-, y- and z-coordinate for end point/arrow head.
% color: specify color of arrow (optional). 
% Color is specified in the same way as with plot. 
% Try: 
% P1 = [1; -1; 1];
% P2 = [0; 1; 0];
% drawArrow3(P1,P2,'b')



x = P1(1);
y = P1(2);
z = P1(3);
u = P2(1)-x;
v = P2(2)-y;
w = P2(3)-z;
if nargin == 2
    quiver3(x,y,z,u,v,w,'off',LineWidth=2);
else 
    quiver3(x,y,z,u,v,w,'off',color,LineWidth=2);
end

end
function drawPlane(n, color)
% Draw a transparent plane with normal vector n
% color: specify color of arrow (optional). 
% Color is specified in the same way as with plot. 
% Try: 
% n = [1; -1; 1];
% drawPlane(n)
% drawPlane(n,'r')

[U,~,~] = svd(n);

U = U*3;
P1 = U(:,2) + U(:,3);
P2 = U(:,2) - U(:,3);
P3 = -U(:,2) - U(:,3);
P4 = -U(:,2) + U(:,3);
P = [P1 P2 P3 P4];

if nargin == 1
    p = patch(P(1,:),P(2,:),P(3,:), 'b');
else 
    p = patch(P(1,:),P(2,:),P(3,:), color);
end

% Set the Face and edge transparency to 0.2 
% using the following properties
set(p,'facealpha',0.2)
set(p,'edgealpha',0.2)

end
function A = matrixRot3(n,v)
% Generate matrix A for 3D rotation of 
% an angle v and along axis n. 
% n: vector of dim 3. 
% v: rotation angle in rad.
% Try 
% n = [1;-1;2]; v = pi/3;
% A = matrixRot3(n,v);

n = n/norm(n);
a = n(1);
b = n(2);
c = n(3);

A = [cos(v)+a*a*(1-cos(v)) a*b*(1-cos(v))-c*sin(v) a*c*(1-cos(v))+b*sin(v); 
    a*b*(1-cos(v))+c*sin(v) cos(v)+b*b*(1-cos(v)) b*c*(1-cos(v))-a*sin(v) ; 
    a*c*(1-cos(v))-b*sin(v) b*c*(1-cos(v))+a*sin(v) cos(v)+c*c*(1-cos(v))] ;
end
function B = Matrixproj3(n)
    n = n / norm(n);
    a = n(1);
    b = n(2);
    c = n(3);
    B =  [1-a^2 -a*b -a*c;
        -a*b 1-b^2 -b*c;
        -a*c -b*c 1-(c^2)];
end
