clear


X = [2 2 4 4 2 2 4 4 6 6 8 8 6 6 8 8 2;
     0 2 2 6 6 8 8 10 10 8 8 6 6 2 2 0 0 ;
     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];

grid on
xlim([-5,5]);
ylim([-4,4]);
axis equal

n = 100;
a = linspace(-2*pi,2*pi,n);
for i = 1:n

    A = matrisTrans(a(i),a(i));
    B = matrisSkjuv(a(i)/2,0)
    Y = B*A*X;

    plot(X(1,:),X(2,:))
    hold on
    plot(Y(1,:),Y(2,:))

    grid on
    xlim([-50,50]);
    ylim([-50,50]);
    hold off
    axis equal
    pause(0.01);

end

 

 

 

function A = matrisTrans(a,b)
A = [1 0 a;0 1 b; 0 0 1];
end
function B = matrisSkjuv(a,b)

B = [1 a 0;b 1 0; 0 0 1];

end