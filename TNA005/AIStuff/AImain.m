clear
load uspsDigits
A = testDigits(:,:,1);

X_train = reshape(trainDigits,256,7291);
y_train = trainAns;
%X_y_comb =  

X_test = reshape(testDigits,256,2007);
y_test = testAns;

y_test_1 = y_test()
k = 1;


%%

y_pred = predict(knn_model, X_test);
accuracy = sum(y_pred == y_test) / length(y_test) * 100;
fprintf('Accuracy: %.2f%%\n', accuracy);