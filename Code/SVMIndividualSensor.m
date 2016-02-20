%% 

%ANchita
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\phoneData');
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\phoneNumericLabel');

% Sarthak
% load('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data\Final\StaticPhoneData');
% load('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data\Final\DynamicPhoneData');
% addpath('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Code\libsvm-3.20\libsvm-3.20\matlab');
% 
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
% 
% parameters = ['-t 1']; 
% model = svmtrain(train_labels,train, parameters);
% [predicted_label, accuracy, decision_values] = svmpredict(test_labels, test, model);

%% Watch
% load('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data\Final\StaticwatchData');
% load('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data\Final\DynamicwatchData');
% addpath('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Code\libsvm-3.20\libsvm-3.20\matlab');
% 
% train = [real(staticWatchTrain);real(dynamicWatchTrain)];
% label1 = ones(size(staticWatchTrain,1),1);
% label2 = ones(size(dynamicWatchTrain,1),1)*2;
% train_labels = [label1;label2];
% 
% test = [staticWatchTest;dynamicWatchTest];
% label1 = ones(size(staticWatchTest,1),1);
% label2 = ones(size(dynamicWatchTest,1),1)*2;
% test_labels = [label1;label2];
% 
% 
% parameters = ['-t 1']; 
% model = svmtrain(train_labels,train, parameters);
% [predicted_label, accuracy, decision_values] = svmpredict(test_labels, test, model);
%% Intra Static for  Phone

% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticPhoneData');
% 
% pc = pca(staticPhoneTrain);
% train =staticPhoneTrain*pc;
% test = staticPhoneTest*pc;
% 
% %TRAINING SVM
% SVMStruct = svmtrain(train,staticPhoneTrainNumLabels,'kernel_function','polynomial');
% predicted_labels = svmclassify(SVMStruct,test);
% 
% 
% C = confusionmat(staticPhoneTestNumLabels,predicted_labels);
% performance = classperf(staticPhoneTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(staticPhoneTestNumLabels,1);

%% Intra Static for watch

% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticwatchData');
% 
% staticWatchTrain = real(staticWatchTrain);
% staticWatchTest = real(staticWatchTest);
% pc = pca(staticWatchTrain);
% train =staticWatchTrain*pc;
% test = staticWatchTest*pc;
% 
% %TRAINING SVM
% SVMStruct = svmtrain(staticWatchTrain,staticWatchTrainNumLabels,'kernel_function','polynomial');
% predicted_labels = svmclassify(SVMStruct,staticWatchTest);
% 
% 
% C = confusionmat(staticWatchTestNumLabels,predicted_labels);
% performance = classperf(staticWatchTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(staticWatchTestNumLabels,1);

%% Intra Dynamic for Phone


% Sarthak

load('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data\Final\DynamicPhoneData');
addpath('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Code\libsvm-3.20\libsvm-3.20\matlab');

pc = pca(dynamicPhoneTrain);
train = dynamicPhoneTrain*pc;
test = dynamicPhoneTest*pc;


parameters = ['-s 0 -c 1000 -t 2']; 
model = svmtrain(dynamicPhoneTrainNumLabels,train, parameters);
[predicted_label, accuracy, decision_values] = svmpredict(dynamicPhoneTestNumLabels, test, model);
C = confusionmat(dynamicPhoneTestNumLabels,predicted_label);
performance = classperf(dynamicPhoneTestNumLabels,predicted_label);
X = performance.CountingMatrix;
correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
accuracy = sum(correctlyClassified)/size(dynamicPhoneTestNumLabels,1);

%% Intra Dynamic for Watch
% 
% load('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data\Final\DynamicwatchData');
% addpath('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Code\libsvm-3.20\libsvm-3.20\matlab');
% 
% 
% parameters = ['-t 2']; 
% model = svmtrain(dynamicWatchTrainNumLabels,dynamicWatchTrain, parameters);
% [predicted_label, accuracy, decision_values] = svmpredict(dynamicWatchTestNumLabels, dynamicWatchTest, model);
% C = confusionmat(dynamicWatchTestNumLabels,predicted_labels);
% performance = classperf(dynamicWatchTestNumLabels,predicted_labels);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));
% accuracy = sum(correctlyClassified)/size(dynamicWatchTestNumLabels,1);



