dataFolder = 'C:\Users\anchita12019\Dropbox\Major Project\Data';
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
