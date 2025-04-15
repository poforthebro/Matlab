clear
X = [2 2 4 4 2 2 4 4 6 6 8 8 6 6 8 8 2;
     0 2 2 6 6 8 8 10 10 8 8 6 6 2 2 0 0;
     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];
% Figur
    
    figure;
    grid on;
    axis equal;
    b = @(x) sin(x)

    n_frames = 100;
    si = linspace(2,10*pi,n_frames);
    a = linspace(0,4*pi,n_frames);
    y = sin(si)

    hold on;
    plot(si, y, 'k', 'LineWidth', 2);
    h1 = plot(X(1, :), X(2, :), 'b', 'LineWidth', 1); 
    h2 = plot(X(1, :), X(2, :), 'r', 'LineWidth', 1);   
for i = 1:n_frames

    A = matrisTrans(a(i),b(a(i)));
    B = matrisSkjuv(y(i),0);
    Y = A*B*X;

    grid on;
    xlim([-20, 20]);
    ylim([-20, 20]);
    axis equal;
    set(h2, 'XData', Y(1, :), 'YData', Y(2, :));
    pause(0.02);
end
    title('animation av skjuvning och translation')
    xlabel('X')
    ylabel('Y')
    legend("sinusvåg",'orginal','förflyttad och skjuvad ')
 
function A = matrisTrans(a,b)
A = [1 0 a;0 1 b; 0 0 1];
end

function B = matrisSkjuv(a,b)
B = [1 a 0;b 1 0; 0 0 1];
end
