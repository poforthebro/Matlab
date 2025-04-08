function predicted_label = testunderrum(testing_number,Y_test,B) % d för dimension
    y = Y_test(:, testing_number);
    num_classes = size(B,3);
    distances = zeros(1,num_classes)
    for i = 1:num_classes
        Bj = B(:,:,i); %väljer siffran för användning från B stora vektorn, typ 2:a form eller 5:a form
        y_proj = Bj * (Bj' * y); % projektions formel för y på Bj siffran
        distances(i) = norm(y_proj - y); % avståndet för det hela för varenda klass
    end
    [~, label] = min(distances);
    predicted_label = label - 1; % Justera index till klassetikett (0-9)
end