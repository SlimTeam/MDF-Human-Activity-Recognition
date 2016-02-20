% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticPhoneData');
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicPhoneData');
% 
% 
% train = [staticPhoneTrain;dynamicPhoneTrain];
% label1 = ones(size(staticPhoneTrain,1),1);
% label2 = ones(size(dynamicPhoneTrain,1),1)*2;
% train_labels = [label1;label2];
% 
% test = [staticPhoneTest;dynamicPhoneTest];
% label1 = ones(size(staticPhoneTest,1),1);
% label2 = ones(size(dynamicPhoneTest,1),1)*2;
% test_labels = [label1;label2];
% 
% columns = [];
% for i=1:size(train,2)
%     v = var(train(:,i));
%     if v==0
%         columns = [columns;i];
%     end
%     
% 
% end
% 
% j = 0;
% for i=1:size(columns,1)
%      columns(i,1)-j
%     
%     train(:,columns(i,1)-j)=[];
%     test(:,columns(i,1)-j)=[];
%     j=j+1;
% end
% 
% 
% %TRAINING NAIVE BAYES
% NBModel = fitNaiveBayes(train,train_labels);
% predicted_labels = predict(NBModel,test);
% 
% 
% C = confusionmat(test_labels,predicted_labels);
% performance = classperf(test_labels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(test_labels,1);



%% For watch
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticwatchData');
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicwatchData');
% 
% 
% train = [real(staticWatchTrain);real(dynamicWatchTrain)];
% label1 = ones(size(staticWatchTrain,1),1);
% label2 = ones(size(dynamicWatchTrain,1),1)*2;
% train_labels = [label1;label2];
% 
% test = [real(staticWatchTest);real(dynamicWatchTest)];
% label1 = ones(size(staticWatchTest,1),1);
% label2 = ones(size(dynamicWatchTest,1),1)*2;
% test_labels = [label1;label2];
% 
% columns = [];
% for i=1:size(train,2)
%     v = var(train(:,i));
%     if v==0
%         columns = [columns;i];
%     end
%     
% 
% end
% 
% j = 0;
% for i=1:size(columns,1)
%      columns(i,1)-j
%     
%     train(:,columns(i,1)-j)=[];
%     test(:,columns(i,1)-j)=[];
%     j=j+1;
% end
% 
% 
% %TRAINING NAIVE BAYES
% NBModel = fitNaiveBayes(train,train_labels);
% predicted_labels = predict(NBModel,test);
% 
% 
% C = confusionmat(test_labels,predicted_labels);
% performance = classperf(test_labels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(test_labels,1);

%% Intra static using phone 

% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticPhoneData');
% 
% 
% columns = [];
% for i=1:size(staticPhoneTrain,2)
%     v = var(staticPhoneTrain(:,i));
%     if v==0
%         columns = [columns;i];
%     end
%     
% 
% end
% 
% j = 0;
% for i=1:size(columns,1)
%      columns(i,1)-j
%     
%     staticPhoneTrain(:,columns(i,1)-j)=[];
%     staticPhoneTest(:,columns(i,1)-j)=[];
%     j=j+1;
% end
% 
% columns = [1;2;3;10;11;12;13;14;15;16;17;18;19;23;24;25;41;42;43;44;45;46;47;48;49;50;51;52;58;59;93;94;95;96;134;135];
% 
% train = [];
% test = [];
% for i=1:size(columns,1)
%      train = [train,staticPhoneTrain(:,columns(i,1))];
%      test = [test,staticPhoneTest(:,columns(i,1))];
% end
% 
% %TRAINING NAIVE BAYES
% NBModel = fitNaiveBayes(train,staticPhoneTrainNumLabels);
% predicted_labels = predict(NBModel,test);
% 
% 
% C = confusionmat(staticPhoneTestNumLabels,predicted_labels);
% performance = classperf(staticPhoneTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(staticPhoneTestNumLabels,1);

%% %% Intra dynamic using phone 

% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicPhoneData');
% 
% 
% columns = [];
% for i=1:size(dynamicPhoneTrain,2)
%     v = var(dynamicPhoneTrain(:,i));
%     if v==0
%         columns = [columns;i];
%     end
%     
% 
% end
% 
% j = 0;
% for i=1:size(columns,1)
%      columns(i,1)-j
%     
%     dynamicPhoneTrain(:,columns(i,1)-j)=[];
%     dynamicPhoneTest(:,columns(i,1)-j)=[];
%     j=j+1;
% end
% 
% pc = pca(dynamicPhoneTrain);
% train = dynamicPhoneTrain*pc;
% test = dynamicPhoneTest*pc;
% 
% %TRAINING NAIVE BAYES
% NBModel = fitNaiveBayes(train,dynamicPhoneTrainNumLabels);
% predicted_labels = predict(NBModel,test);
% 
% 
% C = confusionmat(dynamicPhoneTestNumLabels,predicted_labels);
% performance = classperf(dynamicPhoneTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(dynamicPhoneTestNumLabels,1);

%% Intra static for watch

% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticwatchData');
% 
% 
% columns = [];
% for i=1:size(staticWatchTrain,2)
%     v = var(staticWatchTrain(:,i));
%     if v==0
%         columns = [columns;i];
%     end
%     
% 
% end
% 
% j = 0;
% for i=1:size(columns,1)
%      columns(i,1)-j
%     
%     staticWatchTrain(:,columns(i,1)-j)=[];
%     staticWatchTest(:,columns(i,1)-j)=[];
%     j=j+1;
% end
% 
% columns = [1;2;3;10;11;12;13;14;15;16;17;18;19;23;24;25;41;42;43;44;45;46;47;48;49;50;51;52;58;59;93;94;95;96;134;135];
% 
% train = [];
% test = [];
% for i=1:size(columns,1)
%      train = [train,staticWatchTrain(:,columns(i,1))];
%      test = [test,staticWatchTest(:,columns(i,1))];
% end
% 
% %TRAINING NAIVE BAYES
% NBModel = fitNaiveBayes(real(train),staticWatchTrainNumLabels);
% predicted_labels = predict(NBModel,real(test));
% 
% 
% C = confusionmat(staticWatchTestNumLabels,predicted_labels);
% performance = classperf(staticWatchTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(staticWatchTestNumLabels,1);
%% Intra Dynamic for Watch
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicwatchData');
% 
% 
% columns = [];
% dynamicWatchTrain = real(dynamicWatchTrain);
% for i=1:size(dynamicWatchTrain,2)
%     v = var((dynamicWatchTrain(:,i)));
%     if v>0
%         
%     else
%         columns = [columns;i];
%     end
%     
% 
% end
% 
% columns = [14;columns];
% j = 0;
% for i=1:size(columns,1)
%      columns(i,1)-j
%     
%     dynamicWatchTrain(:,columns(i,1)-j)=[];
%     dynamicWatchTest(:,columns(i,1)-j)=[];
%     j=j+1;
% end
% 
% 
% pc = pca(dynamicWatchTrain);
% train = dynamicWatchTrain*pc;
% test = dynamicWatchTest*pc;
% 
% %TRAINING NAIVE BAYES
% NBModel = fitNaiveBayes(train,dynamicWatchTrainNumLabels);
% predicted_labels = predict(NBModel,real(test));
% 
% 
% C = confusionmat(dynamicWatchTestNumLabels,predicted_labels);
% performance = classperf(dynamicWatchTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(dynamicWatchTestNumLabels,1);
% 
% 
% 
