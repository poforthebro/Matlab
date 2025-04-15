clear
load BrakingDataSet
figure(1);
plot(X_test,Y_test)
xlabel('Fart')
ylabel('Bromsträcka') 
hold on
figure(2);
plot(X_train,Y_train)
xlabel('Fart')
ylabel('Bromsträcka') 
% är mätningarna rimliga?
%%
%först konstruera tränings data i X och y train
clear
load BrakingDataSet
% X variabeln
%X_train = [ones(size(X_train)),X_train];
%X_test = [ones(size(X_test)),X_test];
X_train = [ones(size(X_train,1),1),X_train,X_train(:,1).^2];
X_test = [ones(size(X_test,1),1), X_test, X_test(:,1).^2];
% theta skapning, utlöser en function
theta = X_train\Y_train;
% Väljer specifika theta
theta_1 = theta(1);
theta_2 = theta(2);
theta_3 = theta(3);

% x input
x = linspace(0,30,200);
% y funktionen
y_pred = theta_1 + theta_2 * x + theta_3*x.^2;
% plot 
plot(x,y_pred)
hold on;


%plot(X_train,Y_train,'+')
%plot(X_test,Y_test,'x')


plot(X_train(:,2), Y_train, '+g');
plot(X_test(:,2), Y_test, 'xr');
hold off;

y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 

rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_test = sqrt(mean((Y_test - y_test_pred).^2))
rmse_train_here = rmse(Y_train,y_train_pred)
%%
clear
load AIStuff\Part_2\AutoDataSet.mat

X_train = [ones(size(X_train,1),1),X_train,X_train(:,2),X_train(:,3),X_train(:,4),X_train(:,5)];
X_test = [ones(size(X_test,1),1), X_test, X_test(:,2),X_test(:,3),X_test(:,4),X_test(:,5)]
theta = X_train\Y_train;
theta_1 = theta(1);
theta_2 = theta(2);
theta_3 = theta(3);
theta_4 = theta(4);
theta_5 = theta(5);
theta_6 = theta(6);


sample_points = 1:length(Y_train);

% Plot using plot() instead of scatter()
figure;
plot(sample_points, Y_train, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Actual Fuel Consumption');
hold on;
plot(sample_points, y_train_pred, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Predicted Fuel Consumption');

y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 

rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_test = sqrt(mean((Y_test - y_test_pred).^2))
rmse_train_here = rmse(Y_train,y_train_pred)
%%
clear
load AIStuff\Part_2\usps_nn50_20_10.mat

x = linspace(-5,5,200)
subplot(2,2,1); 
y1 = sigmo(x);
plot(x,y1);
subplot(2,2,2); 
y2 = tanh(x);
plot(x,y2);
subplot(2,2,3); 
y3 = reLUP(x);
plot(x,y3);
subplot(2,2,4); 
y4 = elUP(x,0.2);
plot(x,y4);


correct_counts = zeros(1, 10);
total_counts = zeros(1, 10);
%{
for i = 1:size(Y_test, 2) %storleken
    predicted_label = nn_classifier(i, X_train, x_trainAns, Y_test, k);%prediktionen,använder sig av functionen
    %predicted_label = testunderrum(i,Y_test,B);%prediktionen,använder sig av functionen
    true_label = y_testAns(i);% riktiga svar
    total_counts(true_label + 1) = total_counts(true_label + 1) + 1; %Räkna upp för totala för specifika siffran
    if predicted_label == true_label %checken om den är korrekt
        correct_counts(true_label + 1) = correct_counts(true_label + 1) + 1; %räknaren för totala
    end
end
%display och acc statistik. 
acc = (correct_counts ./ total_counts) * 100;
for digit = 0:9
    fprintf('Digit %d: Correct %d / %d (%.2f%%)\n', digit, correct_counts(digit + 1), total_counts(digit + 1), acc(digit + 1));
end
% magi.
figure(2);
bar(0:9, acc);
xlabel('Digit');
ylabel('Accuracy (%)');
title(sprintf('kNN statistik (k = %d)', k));
grid on;
hold off;
%}
%%
scatter(x_data, y_data, 'b', 'filled');
hold on;

% Plot the regression line
x_range = linspace(min(x_data), max(x_data), 100);
y_range = theta0_hat + theta1_hat * x_range;
plot(x_range, y_range, 'r-', 'LineWidth', 2);

% Add labels and legend
xlabel('x');
ylabel('y');
title('Linear Regression Fit');
legend('Data Points', 'Regression Line', 'Location', 'best');
grid on;
hold off;

