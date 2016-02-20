% folder = 'F:\Dropbox\Major Project\Chimeric\MHEALTHDATASET';
% 
%  for i=1:10
% 
%     rawData = dlmread(strcat(folder,'\RawData','\mHealth_subject',num2str(i),'.log'));
%     filteredData = [];
%     for j=15:20
%         filteredData = [filteredData,medfilt1(rawData(:,j),4)];
%     end
%     filteredData = [filteredData,rawData(:,24)];
%     k = find(filteredData(:,7)==0);
%     filteredData(k,:) = [];
%     k = find(filteredData(:,7)==3);
%     filteredData(k,:) = [];
%     k = find(filteredData(:,7)==6);
%     filteredData(k,:) = [];
%     k = find(filteredData(:,7)==7);
%     filteredData(k,:) = [];
%     k = find(filteredData(:,7)==8);
%     filteredData(k,:) = [];
%     k = find(filteredData(:,7)==9);
%     filteredData(k,:) = [];
%     k = find(filteredData(:,7)==10);
%     filteredData(k,:) = [];
%     save(strcat(folder,'\ProcessedData\',num2str(i),'.mat'),'filteredData');
%  end

 processedFolder = 'F:\Dropbox\Major Project\Chimeric\MHEALTHDATASET\ProcessedData\';
  finalFolder = 'F:\Dropbox\Major Project\Chimeric\MHEALTHDATASET';
 data = [];
 i=4;

  for i=1:10
     
     load(strcat(processedFolder,num2str(i),'.mat'));
     uniqueVals = unique(filteredData(:,size(filteredData,2)));
     for activity=1:size(uniqueVals,1)
         
         k = find(filteredData(:,7)==uniqueVals(activity,1));
         featureVector = makeWindowsAndExtractfeature(filteredData(k,1:3));
         featureVector = [featureVector,makeWindowsAndExtractfeature(filteredData(k,4:6))];
         labels = ones(size(featureVector,1),1)*uniqueVals(activity,1);
         featureVector = [featureVector,labels];
         data = [data;featureVector];
     end
     
  end

indices = randperm(size(data,1));
indices = indices';
noTrain = floor(size(indices,1)*0.7);
trainIndices = indices(1:noTrain,1);
train = data(trainIndices,:);
testIndices = indices(noTrain:size(indices,1),1);
test = data(testIndices,:);

save(strcat(finalFolder,'\train.mat'),'train');
save(strcat(finalFolder,'\test.mat'),'test');
 
% load(strcat(finalFolder,'\train.mat'));
% load(strcat(finalFolder,'\test.mat'));
 

 
 
 