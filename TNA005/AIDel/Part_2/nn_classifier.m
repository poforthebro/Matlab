function predicted_class = nn_classifier(x, W1, b1, W2, b2, W3, b3)
    % Indata:
    % x - testpunkt (256×1 vektor)
    % W1, b1, W2, b2, W3, b3 - nätverksparametrar
    % Utdata:
    % predicted_class - förutsagd klass (0-9)
    % Aktiveringsfunktion ELU med alpha = 0.2
    h = @(z) elUP(z, 0.2);
    % Feed-forward propagation
    z1 = h(W1 * x + b1);        % Första dolda lagret (50 neuroner)
    z2 = h(W2 * z1 + b2);       % Andra dolda lagret (20 neuroner)
    y = W3 * z2 + b3;           % Utdatalager (10 neuroner) - ingen aktiveringsfunktion
    % Hitta klass med högst aktivitet
    [~, k] = max(y);
    predicted_class = k - 1;
end