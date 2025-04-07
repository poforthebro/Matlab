function predicted_label = centroidcreate(testing_number, Y_test, centroids)
    y = Y_test(:, testing_number);
    distances = vecnorm(centroids - y); 
    [~, predicted_label] = min(distances); 
    predicted_label = predicted_label - 1; 
end
