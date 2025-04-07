function B = getunderrum(X_train,x_trainAns,d) % d för dimension
   classes = 0:9;
   num_classes = length(classes);
   B = zeros(size(X_train,1),d, num_classes); % Initialisera en tom vector för B
   for i = 0:num_classes-1 % 0 till 9 men 10 styck
       Xj = X_train(:,x_trainAns == i); %% tar alla indexering och omvandlar den till klass i
       C = Xj * Xj'; %Spektral satsen
       [V, D] = eig(C); %egenvektorer och värde
       
       [~, position] = sort(diag(D), 'descend'); % vad gör jag? sortering efter de största, största blir först, andra blir näststörst
       V = V(:, postion);

       B(:, :, j+1) = V(:, 1:d); %vad gör jag här? sortering efter de viktigaste?
   end
end