load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticPhoneData');
load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicPhoneData');


train = [staticPhoneTrain;dynamicPhoneTrain];
label1 = ones(size(staticPhoneTrain,1),1);
label2 = ones(size(dynamicPhoneTrain,1),1)*2;
train_labels = [label1;label2];

test = [staticPhoneTest;dynamicPhoneTest];
label1 = ones(size(staticPhoneTest,1),1);
label2 = ones(size(dynamicPhoneTest,1),1)*2;
test_labels = [label1;label2];


classificationAccuracy = [];
predicted = [];

for numTrees = 100:50:400
        B = TreeBagger(numTrees,train,train_labels,'Method','classification');
        response = predict(B,test);
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
        numTrees
        correct = 0;
        for i=1:size(test,1)
            %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
            if (predicted(i,1)==test_labels(i,1))
                correct = correct + 1;
            end
        end
        correct
        classificationAccuracy = [classificationAccuracy; numTrees , correct/size(test,1)];
            
        
end 

predicted= [];
[maxVal,ind]  = max(classificationAccuracy(:,2));
numTrees = classificationAccuracy(ind,1);
B = TreeBagger(numTrees,train,train_labels,'Method','classification');
response = predict(B,test);
for i=1:size(response,1)
    predicted = [predicted; str2double(response{i,1})];
end
C = confusionmat(test_labels,predicted);
performance = classperf(test_labels,predicted);
X = performance.CountingMatrix;
correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));


%% Two class classification for watch 
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
% 
% classificationAccuracy = [];
% predicted = [];
% 
% for numTrees = 100:50:400
%         B = TreeBagger(numTrees,train,train_labels,'Method','classification');
%         response = predict(B,test);
%         for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
%         numTrees
%         correct = 0;
%         for i=1:size(test,1)
%             %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
%             if (predicted(i,1)==test_labels(i,1))
%                 correct = correct + 1;
%             end
%         end
%         correct
%         classificationAccuracy = [classificationAccuracy; numTrees , correct/size(test,1)];
%             
%         
% end 
% 
% predicted= [];
% [maxVal,ind]  = max(classificationAccuracy(:,2));
% numTrees = classificationAccuracy(ind,1);
% B = TreeBagger(numTrees,train,train_labels,'Method','classification');
% response = predict(B,test);
% for i=1:size(response,1)
%     predicted = [predicted; str2double(response{i,1})];
% end
% C = confusionmat(test_labels,predicted);
% performance = classperf(test_labels,predicted);
% X = performance.CountingMatrix;

%% Intra STATIC for Phone
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticPhoneData');
% classificationAccuracy = [];
% predicted = [];
% 
% for numTrees = 100:50:400
%         B = TreeBagger(numTrees,staticPhoneTrain,staticPhoneTrainNumLabels,'Method','classification');
%         response = predict(B,staticPhoneTest);
%         for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
%         numTrees
%         correct = 0;
%         for i=1:size(staticPhoneTest,1)
%             %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
%             if (predicted(i,1)==staticPhoneTestNumLabels(i,1))
%                 correct = correct + 1;
%             end
%         end
%         correct
%         classificationAccuracy = [classificationAccuracy; numTrees , correct/size(staticPhoneTest,1)];
%             
%         
% end 
% 
% predicted= [];
% [maxVal,ind]  = max(classificationAccuracy(:,2));
% numTrees = classificationAccuracy(ind,1);
%  B = TreeBagger(numTrees,staticPhoneTrain,staticPhoneTrainNumLabels,'Method','classification');
%         response = predict(B,staticPhoneTest);
% for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
% C = confusionmat(staticPhoneTestNumLabels,predicted);
% performance = classperf(staticPhoneTestNumLabels,predicted);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));

%% Intra Dynamic
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicPhoneData');
% classificationAccuracy = [];
% predicted = [];
% 
% for numTrees = 100:50:400
%         B = TreeBagger(numTrees,dynamicPhoneTrain,dynamicPhoneTrainNumLabels,'Method','classification');
%         response = predict(B,dynamicPhoneTest);
%         for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
%         numTrees
%         correct = 0;
%         for i=1:size(dynamicPhoneTest,1)
%             %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
%             if (predicted(i,1)==dynamicPhoneTestNumLabels(i,1))
%                 correct = correct + 1;
%             end
%         end
%         correct
%         classificationAccuracy = [classificationAccuracy; numTrees , correct/size(dynamicPhoneTest,1)];
%             
%         
% end 
% 
% predicted= [];
% [maxVal,ind]  = max(classificationAccuracy(:,2));
% numTrees = classificationAccuracy(ind,1);
%  B = TreeBagger(numTrees,dynamicPhoneTrain,dynamicPhoneTrainNumLabels,'Method','classification');
%         response = predict(B,dynamicPhoneTest);
% for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
% C = confusionmat(dynamicPhoneTestNumLabels,predicted);
% performance = classperf(dynamicPhoneTestNumLabels,predicted);
% X = performance.CountingMatrix;
% correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));

%% Intra Static for watch
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\StaticwatchData');
% 
% staticWatchTrain = real(staticWatchTrain);
% staticWatchTest = real(staticWatchTest);
% classificationAccuracy = [];
% predicted = [];
% 
% for numTrees = 100:50:400
%         B = TreeBagger(numTrees,staticWatchTrain,staticWatchTrainNumLabels,'Method','classification');
%         response = predict(B,staticWatchTest);
%         for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
%         numTrees
%         correct = 0;
%         for i=1:size(staticWatchTest,1)
%             fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
%             if (predicted(i,1)==staticWatchTestNumLabels(i,1))
%                 correct = correct + 1;
%             end
%         end
%         correct
%         classificationAccuracy = [classificationAccuracy; numTrees , correct/size(staticWatchTestNumLabels,1)];
%             
%         
% end 
% 
% predicted= [];
% [maxVal,ind]  = max(classificationAccuracy(:,2));
% numTrees = classificationAccuracy(ind,1);
% B = TreeBagger(numTrees,staticWatchTrain,staticWatchTrainNumLabels,'Method','classification');
% response = predict(B,staticWatchTest);
% for i=1:size(response,1)
%     predicted = [predicted; str2double(response{i,1})];
% end
% C = confusionmat(staticWatchTestNumLabels,predicted);
% performance = classperf(staticWatchTestNumLabels,predicted);
% X = performance.CountingMatrix;

%% Intra Dynamic for Watch
% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\DynamicwatchData');
% 
% dynamicWatchTrain = real(dynamicWatchTrain);
% dynamicWatchTest = real(dynamicWatchTest);
% classificationAccuracy = [];
% predicted = [];
% 
% for numTrees = 2000:1000:11110
%         B = TreeBagger(numTrees,dynamicWatchTrain,dynamicWatchTrainNumLabels,'Method','classification');
%         response = predict(B,dynamicWatchTest);
%         for i=1:size(response,1)
%             predicted = [predicted; str2double(response{i,1})];
%         end
%         numTrees
%         correct = 0;
%         for i=1:size(dynamicWatchTest,1)
%             %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
%             if (predicted(i,1)==dynamicWatchTestNumLabels(i,1))
%                 correct = correct + 1;
%             end
%         end
%         correct
%         classificationAccuracy = [classificationAccuracy; numTrees , correct/size(dynamicWatchTestNumLabels,1)];
%             
%         
% end 
% 
% predicted= [];
% [maxVal,ind]  = max(classificationAccuracy(:,2));
% numTrees = classificationAccuracy(ind,1);
% B = TreeBagger(numTrees,dynamicWatchTrain,dynamicWatchTrainNumLabels,'Method','classification');
% response = predict(B,dynamicWatchTest);
% for i=1:size(response,1)
%     predicted = [predicted; str2double(response{i,1})];
% end
% C = confusionmat(dynamicWatchTestNumLabels,predicted);
% performance = classperf(dynamicWatchTestNumLabels,predicted);
% X = performance.CountingMatrix;
%  
