folder = 'C:\Users\anchita12019\Dropbox\Major Project\Data\Final';
phoneFolder = strcat(folder,'\Phone');
watchFolder = strcat(folder,'\Watch');

contents = dir(phoneFolder);
phoneTrain = [];
phoneTrain_labels = {};
for i=1:10

    actual = 2+i;
    load(strcat(phoneFolder,'\',contents(actual).name));
    phoneTrain = [phoneTrain;real(phone_Data)];
    phoneTrain_labels = [phoneTrain_labels;phone_label];
end

phoneTest = [];
phoneTest_labels = {};
for i=11:13
    actual = 2+i;
    load(strcat(phoneFolder,'\',contents(actual).name));
    phoneTest = [phoneTest;real(phone_Data)];
    phoneTest_labels = [phoneTest_labels;phone_label];
end
save(strcat(folder,'\PhoneData'),'phoneTrain','phoneTrain_labels','phoneTest','phoneTest_labels');

% 
%% for watch

contents = dir(watchFolder);
watchTrain = [];
watchTrain_labels = {};
for i=1:1
    actual = 2+i;
    load(strcat(watchFolder,'\',contents(actual).name));
    watchTrain = [watchTrain;watch_Data];
    watchTrain_labels = [watchTrain_labels;watch_label];
end

watchTest = [];
watchTest_labels = {};
for i=11:13
    actual = 2+i;
    load(strcat(watchFolder,'\',contents(actual).name));
    watchTest = [watchTest;watch_Data];
    watchTest_labels = [watchTest_labels;watch_label];
end
save(strcat(folder,'\WatchData'),'watchTrain','watchTrain_labels','watchTest','watchTest_labels');
    



