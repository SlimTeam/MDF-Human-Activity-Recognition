finalFolder = 'F:\Dropbox\Major Project\Chimeric\MHEALTHDATASET';
load(strcat(finalFolder,'\train.mat'));
load(strcat(finalFolder,'\test.mat'));

classificationAccuracy = [];
predicted = [];
featureSize = size(train,2) - 1;
for numTrees = 100:100:200
        B = TreeBagger(numTrees,train(:,1:featureSize),train(:,featureSize+1),'Method','classification');
        response = predict(B,test(:,1:featureSize));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
        numTrees
        correct = 0;
        for i=1:size(test,1)
            %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
            if (predicted(i,1)==test(i,featureSize+1))
                correct = correct + 1;
            end
        end
        correct
        classificationAccuracy = [classificationAccuracy; numTrees , correct/size(test,1)];
            
        
end 

[maxVal,ind]  = max(classificationAccuracy(:,2));
numTrees = classificationAccuracy(ind,1);
B = TreeBagger(numTrees,train(:,1:featureSize),train(:,featureSize+1),'Method','classification');
response = predict(B,test(:,1:featureSize));
for i=1:size(response,1)
    predicted = [predicted; str2double(response{i,1})];
end
C = confusionmat(test(:,featureSize+1),predicted);
performance = classperf(test(:,featureSize+1),predicted);
X = performance.CountingMatrix;
correctlyClassified = X(sub2ind(size(X),1:(size(X,1)-1),1:size(X,2)));