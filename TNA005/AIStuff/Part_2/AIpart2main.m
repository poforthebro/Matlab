%% Visualiseringar
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
%% Linjär Model Regression
%först konstruera tränings data i X och y train
clear
load BrakingDataSet

% X variabeln
X_train = [ones(size(X_train)),X_train];
X_test = [ones(size(X_test)),X_test];

% theta skapning, utlöser en function
theta = X_train\Y_train;

% Väljer specifika theta
theta_1 = theta(1);
theta_2 = theta(2);


% x input
x = linspace(0,30,200);

% y funktionen prediktion
y_pred = theta_1 + theta_2 * x;

% plot 
plot(x,y_pred)
hold on;

% plot för punkter
plot(X_train(:,2),Y_train,'+')
plot(X_test(:,2),Y_test,'x')
hold off;

% Prediktioner med originala linjers egenskaper.
y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 

% Olika RMSE utlösningar (samma svar)
rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_test = sqrt(mean((Y_test - y_test_pred).^2))
rmse_train_here = rmse(Y_train,y_train_pred)
rmse_test_here = rmse(Y_test,y_test_pred)

%% Kvadrat Model Regression
%först konstruera tränings data i X och y train
clear
load BrakingDataSet

% X variabeln
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

plot(X_train(:,2), Y_train, '+g');
plot(X_test(:,2), Y_test, 'xr');
hold off;

% Prediktioner med originala linjers egenskaper.
y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 


% Olika RMSE utlösningar (samma svar)
rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_test = sqrt(mean((Y_test - y_test_pred).^2))
rmse_train_here = rmse(Y_train,y_train_pred)
rmse_test_here = rmse(Y_test,y_test_pred)
%% Kubik Model Regression
%först konstruera tränings data i X och y train
clear
load BrakingDataSet
% X variabeln
%X_train = [ones(size(X_train)),X_train];
%X_test = [ones(size(X_test)),X_test];
X_train = [ones(size(X_train,1),1),X_train,X_train.^2,X_train.^3];
X_test = [ones(size(X_test,1),1), X_test, X_test.^2,X_test.^3];
% theta skapning, utlöser en function
theta = X_train\Y_train;
% Väljer specifika theta
theta_1 = theta(1);
theta_2 = theta(2);
theta_3 = theta(3);
theta_4 = theta(4);

% x input
x = linspace(0,30,200);
% y funktionen
y_pred = theta_1 + theta_2 * x + theta_3*x.^2 + theta_4*x.^3;
% plot 
plot(x,y_pred)
hold on;


plot(X_train(:,2), Y_train, '+g');
plot(X_test(:,2), Y_test, 'xr');
hold off;

y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 

rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_test = sqrt(mean((Y_test - y_test_pred).^2))
rmse_train_here = rmse(Y_train,y_train_pred)
%% Model med flera parameter linjär regression
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


y_train_pred = X_train * theta; 
y_test_pred = X_test * theta; 


figure;
plot(sample_points, Y_train, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Actual Fuel Consumption');
hold on;
plot(sample_points, y_train_pred, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Predicted Fuel Consumption');

rmse_train = sqrt(mean((Y_train - y_train_pred).^2))
rmse_test = sqrt(mean((Y_test - y_test_pred).^2))
rmse_train_here = rmse(Y_train,y_train_pred)
%%
clear
load AIStuff\Part_2\usps_nn50_20_10.mat
load AIStuff\Part_2\uspsDigits.mat
x = linspace(-5,5,200);
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



X_train = reshape(trainDigits, 256,7291);
x_trainAns = trainAns;
Y_test = reshape(testDigits, 256, 2007);
y_testAns = testAns;
correct_counts = zeros(1, 10);
total_counts = zeros(1, 10);


for i = 1:size(Y_test, 2) %storleken
    predicted_label = nn_classifier(Y_test(:,i), W1, b1, W2, b2, W3, b3);%prediktionen,använder sig av functionen
    %predicted_label = testunderrum(i,Y_test,B);%prediktionen,använder sig av functionen
    true_label = y_testAns(i);% riktiga svar
    total_counts(true_label + 1) = total_counts(true_label + 1) + 1; %Räkna upp för totala för specifika siffran
    if predicted_label == true_label %checken om den är korrekt
        correct_counts(true_label + 1) = correct_counts(true_label + 1) + 1; %räknaren för totala
    end
end
%display och acc statistik. 
acc = (correct_counts ./ total_counts) * 100;
total_correct = sum(correct_counts);
total_samples = sum(total_counts);
total_accuracy = (total_correct / total_samples) * 100;
for digit = 0:9
    fprintf('Digit %d: Correct %d / %d (%.2f%%)\n', digit, correct_counts(digit + 1), total_counts(digit + 1), acc(digit + 1));
end
fprintf('\nTotal: Correct %d / %d (%.2f%%)\n', total_correct, total_samples, total_accuracy);
% magi.
figure(2);
bar(0:9, acc);
xlabel('Digit');
ylabel('Accuracy (%)');

grid on;
hold off;
%% 100 70 10
clear
load AIStuff\Part_2\usps_nn100_70_10.mat
load AIStuff\Part_2\uspsDigits.mat
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



X_train = reshape(trainDigits, 256,7291);
x_trainAns = trainAns;
Y_test = reshape(testDigits, 256, 2007);
y_testAns = testAns;
correct_counts = zeros(1, 10);
total_counts = zeros(1, 10);


for i = 1:size(Y_test, 2) %storleken
    predicted_label = nn_classifier(Y_test(:,i), W1, b1, W2, b2, W3, b3);%prediktionen,använder sig av functionen
    %predicted_label = testunderrum(i,Y_test,B);%prediktionen,använder sig av functionen
    true_label = y_testAns(i);% riktiga svar
    total_counts(true_label + 1) = total_counts(true_label + 1) + 1; %Räkna upp för totala för specifika siffran
    if predicted_label == true_label %checken om den är korrekt
        correct_counts(true_label + 1) = correct_counts(true_label + 1) + 1; %räknaren för totala
    end
end
%display och acc statistik. 
acc = (correct_counts ./ total_counts) * 100;
total_correct = sum(correct_counts);
total_samples = sum(total_counts);
total_accuracy = (total_correct / total_samples) * 100;
for digit = 0:9
    fprintf('Digit %d: Correct %d / %d (%.2f%%)\n', digit, correct_counts(digit + 1), total_counts(digit + 1), acc(digit + 1));
end
fprintf('\nTotal: Correct %d / %d (%.2f%%)\n', total_correct, total_samples, total_accuracy);
% magi.
figure(2);
bar(0:9, acc);
xlabel('Digit');
ylabel('Accuracy (%)');

grid on;
hold off;
%% Frågor
% Graf för model med flera parameter
% Hur räknar man ut mängden parameter utifrån Wn och bn
% Varför 256*10*10 B, är det inte fel?