function predicted_label = kNN(testing_number, X_train, x_trainAns, Y_test, k)
    y = Y_test(:,testing_number);
    dist = zeros(1, size(X_train, 2));
    for i = 1:size(X_train, 2)
        dist(i) = norm(X_train(:, i) - y);
    end
    [~, smallest_index] = mink(dist, k);
    neighbor_labels = x_trainAns(smallest_index);
    predicted_label = mode(neighbor_labels);
end

