%% Classification based on Optical Flow
run('GLOBAL.m');
addpath('C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Code\libsvm-3.20\libsvm-3.20\matlab');
%% Go Over Clean Data
% Sarthak
 dataFolder = 'C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data';

% Anchita
% dataFolder = 'F:\Dropbox\Major Project\Data';

 cleanDataFolder = strcat(dataFolder,'\Cleaned Data');
 contents = dir(cleanDataFolder);   

 DATAMATRIX={};
 for i = 3:size(contents,1),
     if(~isempty(findstr(contents(i).name,'_OF'))),
         load(strcat(dataFolder,'\Cleaned Data\',contents(i).name));
         DATAMATRIX=[DATAMATRIX;OF];
     end
 end
 
 Features=[];
 Labels=[];
 
%% Create Combined Feature Vector
for i = 1:size(DATAMATRIX,1),
    data=DATAMATRIX(i,1);
    numFrames=size(data.LK_X_raw,1);
    fv = [data.FOE_center_dist, data.FOE_y, data.FOE_x, data.Mean_raw_mag_temporal_stddev, data.Mean_raw_magnitude, data.Mean_smooth_magnitude, data.Diff_raw_smooth, data.Cluster_bot_mean_mag, data.Cluster_top_mean_mag, data.Clusters_distance, data.Template_response, data.LK_valid_count_smooth, data.LK_valid_count];
    Features=[Features;fv]; 
    Labels=[Labels;data.Labels];
end

ConvertedLabels=[];
ConvertedFeatures=[];
for i=1:size(Labels,1),
    for j =1:size(activities,2),
         temp = findstr(char(activities(1,j)),char(Labels(i)));
         if(~isempty(temp)),
             if(j==1||j==2)
                ConvertedLabels=[ConvertedLabels;1];
                
             else,
                ConvertedLabels=[ConvertedLabels;-1];
             end
             ConvertedFeatures=[ConvertedFeatures;Features(i,:)];
             break;
         end
     end
end

%% Train SVM
parameters = ['-t 1 -v ', num2str(10)]; 
model = svmtrain(ConvertedLabels, ConvertedFeatures, parameters);
