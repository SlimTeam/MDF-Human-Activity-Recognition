folder = 'C:\Users\anchita12019\Dropbox\Major Project\Data\Final';
load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\PhoneData');


k = find(phoneTrainNumLabels(:,1)==1);
j = find(phoneTrainNumLabels(:,1)==2);
k = [k;j];
staticPhoneTrain = phoneTrain(k,:);
staticPhoneTrainLabels = phoneTrain_labels(k,:);
staticPhoneTrainNumLabels = phoneTrainNumLabels(k,:);

k = find(phoneTestNumLabels(:,1)==1);
j = find(phoneTestNumLabels(:,1)==2);
k = [k;j];
staticPhoneTest = phoneTest(k,:);
staticPhoneTestLabels = phoneTest_labels(k,:);
staticPhoneTestNumLabels = phoneTestNumLabels(k,:);

save(strcat(folder,'\StaticPhoneData'),'staticPhoneTrain','staticPhoneTrainLabels','staticPhoneTrainNumLabels','staticPhoneTest','staticPhoneTestLabels','staticPhoneTestNumLabels');

%% 
% For watch

load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\WatchData');


k = find(watchTrainNumLabels(:,1)==1);
j = find(watchTrainNumLabels(:,1)==2);
k = [k;j];
staticWatchTrain = watchTrain(k,:);
staticWatchTrainLabels = watchTrain_labels(k,:);
staticWatchTrainNumLabels = watchTrainNumLabels(k,:);

k = find(watchTestNumLabels(:,1)==1);
j = find(watchTestNumLabels(:,1)==2);
k = [k;j];
staticWatchTest = watchTest(k,:);
staticWatchTestLabels = watchTest_labels(k,:);
staticWatchTestNumLabels = watchTestNumLabels(k,:);

save(strcat(folder,'\StaticwatchData'),'staticWatchTrain','staticWatchTrainLabels','staticWatchTrainNumLabels','staticWatchTest','staticWatchTestLabels','staticWatchTestNumLabels');
%% 
% Dynamic for phone

load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\PhoneData');


k = find(phoneTrainNumLabels(:,1)==3);
j = find(phoneTrainNumLabels(:,1)==4);
k = [k;j];
j = find(phoneTrainNumLabels(:,1)==5);
k = [k;j];
j = find(phoneTrainNumLabels(:,1)==6);
k = [k;j];
j = find(phoneTrainNumLabels(:,1)==7);
k = [k;j];

dynamicPhoneTrain = phoneTrain(k,:);
dynamicPhoneTrainLabels = phoneTrain_labels(k,:);
dynamicPhoneTrainNumLabels = phoneTrainNumLabels(k,:);

k = find(phoneTestNumLabels(:,1)==3);
j = find(phoneTestNumLabels(:,1)==4);
k = [k;j];
j = find(phoneTestNumLabels(:,1)==5);
k = [k;j];
j = find(phoneTestNumLabels(:,1)==6);
k = [k;j];
j = find(phoneTestNumLabels(:,1)==7);
k = [k;j];
dynamicPhoneTest = phoneTest(k,:);
dynamicPhoneTestLabels = phoneTest_labels(k,:);
dynamicPhoneTestNumLabels = phoneTestNumLabels(k,:);

save(strcat(folder,'\DynamicPhoneData'),'dynamicPhoneTrain','dynamicPhoneTrainLabels','dynamicPhoneTrainNumLabels','dynamicPhoneTest','dynamicPhoneTestLabels','dynamicPhoneTestNumLabels');
%% 
% Dynamic for watch
load('C:\Users\anchita12019\Dropbox\Major Project\Data\Final\WatchData');


k = find(watchTrainNumLabels(:,1)==3);
j = find(watchTrainNumLabels(:,1)==4);
k = [k;j];
j = find(watchTrainNumLabels(:,1)==5);
k = [k;j];
j = find(watchTrainNumLabels(:,1)==6);
k = [k;j];
j = find(watchTrainNumLabels(:,1)==7);
k = [k;j];
dynamicWatchTrain = watchTrain(k,:);
dynamicWatchTrainLabels = watchTrain_labels(k,:);
dynamicWatchTrainNumLabels = watchTrainNumLabels(k,:);

k = find(watchTestNumLabels(:,1)==3);
j = find(watchTestNumLabels(:,1)==4);
k = [k;j];
j = find(watchTestNumLabels(:,1)==5);
k = [k;j];
j = find(watchTestNumLabels(:,1)==6);
k = [k;j];
j = find(watchTestNumLabels(:,1)==7);
k = [k;j];
dynamicWatchTest = watchTest(k,:);
dynamicWatchTestLabels = watchTest_labels(k,:);
dynamicWatchTestNumLabels = watchTestNumLabels(k,:);

save(strcat(folder,'\DynamicwatchData'),'dynamicWatchTrain','dynamicWatchTrainLabels','dynamicWatchTrainNumLabels','dynamicWatchTest','dynamicWatchTestLabels','dynamicWatchTestNumLabels');

