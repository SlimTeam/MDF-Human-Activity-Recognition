% trainingUCI = dlmread('F:\Dropbox\Major Project\Chimeric\UCI HAR Dataset\train\X_train.txt');
% trainingUCI_labels = dlmread('F:\Dropbox\Major Project\Chimeric\UCI HAR Dataset\train\y_train.txt');
% 
% trainUCI = [trainingUCI(:,1:40),trainingUCI(:,121:160),trainingUCI(:,266:290),trainingUCI(:,297:302),trainingUCI(:,424:448),trainingUCI(:,455:460),trainingUCI_labels];
% 
% testingUCI = dlmread('F:\Dropbox\Major Project\Chimeric\UCI HAR Dataset\test\X_test.txt');
% testUCI_labels = dlmread('F:\Dropbox\Major Project\Chimeric\UCI HAR Dataset\test\y_test.txt');
% testUCI = [testingUCI(:,1:40),testingUCI(:,121:160),testingUCI(:,266:290),testingUCI(:,297:302),testingUCI(:,424:448),testingUCI(:,455:460),testUCI_labels];


  load('F:\Dropbox\Major Project\Chimeric\UCI HAR Dataset\train.mat');
  load('F:\Dropbox\Major Project\Chimeric\UCI HAR Dataset\test.mat');


classificationAccuracy = [];
predicted = [];
featureSize = size(trainUCI,2) - 1;
for numTrees = 5:20:400
        B = TreeBagger(numTrees,trainUCI(:,1:featureSize),trainUCI(:,featureSize+1),'Method','classification');
        response = predict(B,testUCI(:,1:featureSize));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
        numTrees
        correct = 0;
        for i=1:size(testUCI,1)
            %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
            if (predicted(i,1)==testUCI(i,featureSize+1))
                correct = correct + 1;
            end
        end
        correct
        classificationAccuracy = [classificationAccuracy; numTrees , correct/size(testUCI,1)];
            
        
end 

[maxVal,ind]  = max(classificationAccuracy(:,2));
numTrees = classificationAccuracy(ind,1);
B = TreeBagger(numTrees,trainUCI(:,1:featureSize),trainUCI(:,featureSize+1),'Method','classification');
response = predict(B,testUCI(:,1:featureSize));
for i=1:size(response,1)
    predicted = [predicted; str2double(response{i,1})];
end
C = confusionmat(testUCI(:,featureSize+1),predicted);
performance = classperf(testUCI(:,featureSize+1),predicted);
X = performance.CountingMatrix;
correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));