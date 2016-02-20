% folder = 'C:\Users\anchita12019\Dropbox\Major Project\Data\Final\';
% load(strcat(folder,'PhoneData'));
% 
% run('GLOBAL');
% 
% phoneTrainNumLabels = zeros(size(phoneTrain,1),1);
% phoneT_labels = [phoneTrain_labels{:}];
% for i=1:size(activities,2)
%     activities{1,i}
%     
%     k = strfind(phoneT_labels,activities{1,i});
%      Index = find(not(cellfun('isempty', k)));
%     phoneTrainNumLabels(Index,1)=i;
% end
% 
% phoneTestNumLabels = zeros(size(phoneTest,1),1);
% phoneTe_labels = [phoneTest_labels{:}];
% for i=1:size(activities,2)
%     activities{1,i}
%     
%     k = strfind(phoneTe_labels,activities{1,i});
%      Index = find(not(cellfun('isempty', k)));
%     phoneTestNumLabels(Index,1)=i;
% end
% save(strcat(folder,'PhoneData'),'phoneTrain','phoneTrain_labels','phoneTest','phoneTest_labels','phoneTrainNumLabels','phoneTestNumLabels');


%% For watch 


folder = 'C:\Users\anchita12019\Dropbox\Major Project\Data\Final\';
load(strcat(folder,'WatchData'));

run('GLOBAL');

watchTrainNumLabels = zeros(size(watchTrain,1),1);
watchT_labels = [watchTrain_labels{:}];
for i=1:size(activities,2)
    activities{1,i}
    
    k = strfind(watchT_labels,activities{1,i});
     Index = find(not(cellfun('isempty', k)));
    watchTrainNumLabels(Index,1)=i;
end

watchTestNumLabels = zeros(size(phoneTest,1),1);
watchTe_labels = [watchTest_labels{:}];
for i=1:size(activities,2)
    activities{1,i}
    
    k = strfind(watchTe_labels,activities{1,i});
     Index = find(not(cellfun('isempty', k)));
    watchTestNumLabels(Index,1)=i;
end
save(strcat(folder,'WatchData'),'watchTrain','watchTrain_labels','watchTest','watchTest_labels','watchTrainNumLabels','watchTestNumLabels');

