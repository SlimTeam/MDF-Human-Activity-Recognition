load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\PhoneData');




CVO = cvpartition(phoneTrainNumLabels,'k',10);
err = zeros(CVO.NumTestSets,1);
CVO.NumTestSets
for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    fprintf('SIze of training data is %g\ns',size(find(trIdx(:,1)==1),1));
    fprintf('SIze of testing data is %g',size(find(teIdx(:,1)==1),1));
    B = TreeBagger(200,phoneTrain(trIdx,:),phoneTrainNumLabels(trIdx,:),'Method','classification');
    response = predict(B,phoneTrain(teIdx,:));
    predicted = [];
    for j=1:size(response,1)
            predicted = [predicted; str2double(response{j,1})];
        end
    err(i) = sum(predicted(:,1)~=phoneTrainNumLabels(teIdx,1))
end
cvErr = sum(err)/sum(CVO.TestSize);

%% 
% FOR WATCH

% load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\WatchData');
% 
% 
% 
% 
% CVO = cvpartition(watchLabels,'k',10);
% err = zeros(CVO.NumTestSets,1);
% CVO.NumTestSets
% for i = 1:CVO.NumTestSets
%     trIdx = CVO.training(i);
%     teIdx = CVO.test(i);
%     fprintf('SIze of training data is %g\ns',size(find(trIdx(:,1)==1),1));
%     fprintf('SIze of testing data is %g',size(find(teIdx(:,1)==1),1));
%     B = TreeBagger(200,watch_Data(trIdx,:),watchLabels(trIdx,:),'Method','classification');
%     response = predict(B,watch_Data(teIdx,:));
%     predicted = [];
%     for j=1:size(response,1)
%             predicted = [predicted; str2double(response{j,1})];
%         end
%     err(i) = sum(predicted(:,1)~=watchLabels(teIdx,1))
% end
% cvErr = sum(err)/sum(CVO.TestSize);
% 
% 
