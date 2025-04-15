function y = elUP(x, alpha)
    if nargin < 2
        alpha = 0.2; % Standardvärde om alpha inte anges
    end
    y = x;
    y(x < 0) = alpha * (exp(y(x < 0)) - 1);
end