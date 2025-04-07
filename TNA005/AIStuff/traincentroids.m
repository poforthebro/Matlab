function centroids = traincentroids(X_train, x_trainAns)
    classes = 0:9;
    num_classes = length(classes);
    centroids = zeros(256, num_classes); 
    for class = classes
        class_samples = X_train(:, x_trainAns == class);  % Select samples for this class
        centroids(:, class + 1) = mean(class_samples, 2);  % Compute the mean (centroid) of the class
    end
end