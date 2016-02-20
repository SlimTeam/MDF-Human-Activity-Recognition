% %ANCHITA
% %dataFolder = 'C:\Users\anchita12019\Dropbox\Major Project';
% 
% %SARTHAK
% dataFolder = 'C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project';
% 
% columns = [26;31;36;100;105;110];
% 
% folder = strcat(dataFolder,'\Data\Final');
% phoneFolder = strcat(folder,'\Phone');
% watchFolder = strcat(folder,'\Watch');
% run('GLOBAL');
% contents = dir(phoneFolder);
% train = [];
% train_labels = [];
% noOfFrames = 6;
% count = 1;
% for i=1:10
%     actual = 2+i;
%     load(strcat(phoneFolder,'\',contents(actual).name));
%     load(strcat(watchFolder,'\',contents(actual).name));
%     phoneT_labels = [phone_label{:}];
%     watchT_label = [watch_label{:}];
%     count = count+2;
%     for j=3:7
%          pk = strfind(phoneT_labels,activities{1,j});
%          pIndex = find(not(cellfun('isempty', pk)));
%           pIndex =  pIndex';
%           wk = strfind(watchT_label,activities{1,j});
%          wIndex = find(not(cellfun('isempty', wk)));
%           data = DATAMATRIX(count,1);
%           wIndex= wIndex';
%           camera_Data = [data.FOE_center_dist, data.FOE_y, data.FOE_x, data.Mean_raw_mag_temporal_stddev, data.Mean_raw_magnitude, data.Mean_smooth_magnitude, data.Diff_raw_smooth, data.Cluster_bot_mean_mag, data.Cluster_top_mean_mag, data.Clusters_distance, data.Template_response, data.LK_valid_count_smooth, data.LK_valid_count];
%          pInterval = floor(size(pIndex,1)/6);
%          wInterval = floor(size(wIndex,1)/6);
%          cInterval = floor(size(camera_Data,1)/6);
%          pCurrent = 1;
%          wCurrent = 1;
%          cCurrent = 1;
%          if ~size(pIndex,1)==0
%            for k=1:noOfFrames-1
%                
%                pSelect   = pIndex(pCurrent:pCurrent+pInterval,:);
%                wSelect   = wIndex(wCurrent:wCurrent+wInterval,:);
%                [p,w,c] = predictFrame(phone_Data(pSelect,:),watch_Data(wSelect,:),camera_Data(cCurrent:cInterval+cCurrent,:),2,columns);
%                train = [train; p w c ];
%                train_labels = [train_labels;j];
%                pCurrent = pCurrent+pInterval;
%                 wCurrent = wCurrent+wInterval;
%                 cCurrent = cCurrent+cInterval;
%            end
%          end
%            
%     count = count +1;
%     end
%    
% end
% 
% 
% test = [];
% test_labels = [];
% count = 106;
% for i=11:13
%     actual = 2+i;
%     load(strcat(phoneFolder,'\',contents(actual).name));
%     load(strcat(watchFolder,'\',contents(actual).name));
%     phoneT_labels = [phone_label{:}];
%     watchT_label = [watch_label{:}];
%     count = count+2;
%     for j=3:7
%          pk = strfind(phoneT_labels,activities{1,j});
%          pIndex = find(not(cellfun('isempty', pk)));
%           pIndex =  pIndex';
%           wk = strfind(watchT_label,activities{1,j});
%          wIndex = find(not(cellfun('isempty', wk)));
%            wIndex= wIndex';
%           data = DATAMATRIX(count,1);
%           camera_Data = [data.FOE_center_dist, data.FOE_y, data.FOE_x, data.Mean_raw_mag_temporal_stddev, data.Mean_raw_magnitude, data.Mean_smooth_magnitude, data.Diff_raw_smooth, data.Cluster_bot_mean_mag, data.Cluster_top_mean_mag, data.Clusters_distance, data.Template_response, data.LK_valid_count_smooth, data.LK_valid_count];
%       
%          pInterval = floor(size(pIndex,1)/6);
%          wInterval = floor(size(wIndex,1)/6);
%          cInterval = floor(size(camera_Data,1)/6);
%          pCurrent = 1;
%          wCurrent = 1;
%          cCurrent = 1;
%            for k=1:noOfFrames-1
%                 pSelect   = pIndex(pCurrent:pCurrent+pInterval,:);
%                wSelect   = wIndex(wCurrent:wCurrent+wInterval,:);
%                [p,w,c] = predictFrame(phone_Data(pSelect,:),watch_Data(wSelect,:),camera_Data(cCurrent:cInterval+cCurrent,:),2,columns);
%               test = [test; p w c ];
%                test_labels = [test_labels;j];
%                
%                pCurrent = pCurrent+pInterval;
%                 wCurrent = wCurrent+wInterval;
%                 cCurrent = cCurrent+cInterval;
%            end
%            
%     count = count +1;
%     end
%     
% end

% FITTING NAIVE BAYES

 NBModel = fitNaiveBayes([train(:,1),train(:,3)],train_labels);
predicted_labels = predict(NBModel,test);
%predicted_labels = test(:,1);
err = sum(predicted_labels~=test_labels)/size(test,1);
