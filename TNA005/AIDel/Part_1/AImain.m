%% kNN

clear;
load uspsDigits;

%variabler
k = 1;

X_train = reshape(trainDigits, 256,7291);
x_trainAns = trainAns;
Y_test = reshape(testDigits, 256, 2007);
y_testAns = testAns;

%enstaka testning
%{
predicted_label = kNN(testing_number,X_train,x_trainAns,Y_test,k)
true_label = y_testAns(testing_number);
if predicted_label == true_label
fprintf('Correct! It is a: %d\n', true_label);
else
fprintf('Incorrect! It is a: %d\n', true_label);
end
%}

% tomma vectorer för räkning
correct_counts = zeros(1, 10);
total_counts = zeros(1, 10);

for i = 1:size(Y_test, 2) %storleken
    predicted_label = kNN(i, X_train, x_trainAns, Y_test, k);%prediktionen,använder sig av functionen
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
title(sprintf('kNN statistik (k = %d)', k));
grid on;
hold off;
%% Centroid
clear;
load uspsDigits;

%variabler
X_train = reshape(trainDigits, 256,7291);
x_trainAns = trainAns;
Y_test = reshape(testDigits, 256, 2007);
y_testAns = testAns;

% tomma vectorer för räkning
correct_counts = zeros(1, 10);
total_counts = zeros(1, 10);


centroids = traincentroids(X_train, x_trainAns);
centroids_correct = reshape(centroids,16,16,[]);
centroids_correct_1 = centroids_correct(:,:,1);
subplot(1,2,1);
ima(centroids_correct_1)
title("Valt Siffra att se!")
hold on;


for i = 1:size(Y_test, 2) %storleken
    predicted_label = centroidcreate(i,Y_test,centroids);%prediktionen,använder sig av functionen
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
subplot(1,2,2);
bar(0:9, acc);
xlabel('Digit');
ylabel('Accuracy (%)');
title("Centroid Statistik");
grid on;
hold off;
%% Underrrum
clear;
load uspsDigits;

%variabler
d = 10; %dimensioner att behålla

X_train = reshape(trainDigits, 256,7291);
x_trainAns = trainAns;
Y_test = reshape(testDigits, 256, 2007);
y_testAns = testAns;

% tomma vectorer för räkning
correct_counts = zeros(1, 10);
total_counts = zeros(1, 10);

% Minskade versioner av en specifik klass med viktigaste egenskaper sparade
B = getunderrum(X_train,x_trainAns,d);
B_managed = reshape(B,10,10,[]);
B_managed_choose = B_managed(:,:,5);
subplot(1,2,1);
ima(B_managed_choose)
title("Valt Siffra att se!")
hold on;


for i = 1:size(Y_test, 2) %storleken
    predicted_label = testunderrum(i,Y_test,B);%prediktionen,använder sig av functionen
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
subplot(1,2,2);
bar(0:9, acc);
xlabel('Digit');
ylabel('Accuracy (%)');
title(sprintf('Projektions metoden med dimension (d = %d)', d));
grid on;
hold off;