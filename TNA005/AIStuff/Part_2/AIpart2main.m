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
X_train = [ones(size(X_train)),X_train];
X_test = [ones(size(X_test)),X_test];
% theta skapning, utlöser en function
theta = X\Y_train;
% Väljer specifika theta
theta_1 = theta(1);
theta_2 = theta(2);

% x input
x = linspace(0,30,200);
% y funktionen
y_pred = theta_1 + theta_2 * x;
% plot 
plot(x,y_pred)
hold on;
plot(X_train,Y_train,'+')
plot(X_test,Y_test,'x')
hold off;

y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 

rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_train_2 = sqrt(mean((Y_test - y_test_pred)))











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

