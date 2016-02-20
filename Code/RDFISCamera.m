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
 
 TrainingFeatures=[];
 TrainingLabels=[];
 
%% Create Training Feature Vector
for i = 1:70,
    data=DATAMATRIX(i,1);
    numFrames=size(data.LK_X_raw,1);
    fv = [data.FOE_center_dist, data.FOE_y, data.FOE_x, data.Mean_raw_mag_temporal_stddev, data.Mean_raw_magnitude, data.Mean_smooth_magnitude, data.Diff_raw_smooth, data.Cluster_bot_mean_mag, data.Cluster_top_mean_mag, data.Clusters_distance, data.Template_response, data.LK_valid_count_smooth, data.LK_valid_count];
    TrainingFeatures=[TrainingFeatures;fv]; 
    TrainingLabels=[TrainingLabels;data.Labels];
end

ConvertedTrainingLabels=[];
ConvertedTrainingFeatures=[];
for i=1:size(TrainingLabels,1),
    for j =1:size(activities,2),
         temp = findstr(char(activities(1,j)),char(TrainingLabels(i)));
         if(~isempty(temp)),
             if(j==1)
                ConvertedTrainingLabels=[ConvertedTrainingLabels;1];
                ConvertedTrainingFeatures=[ConvertedTrainingFeatures;TrainingFeatures(i,:)];
             elseif(j==2),
                ConvertedTrainingLabels=[ConvertedTrainingLabels;2];
                ConvertedTrainingFeatures=[ConvertedTrainingFeatures;TrainingFeatures(i,:)];
             end
             break;
         end
     end
end

 TestingFeatures=[];
 TestingLabels=[];
 
%% Create Testing Feature Vector
for i = 71:126,
    data=DATAMATRIX(i,1);
    numFrames=size(data.LK_X_raw,1);
    fv = [data.FOE_center_dist, data.FOE_y, data.FOE_x, data.Mean_raw_mag_temporal_stddev, data.Mean_raw_magnitude, data.Mean_smooth_magnitude, data.Diff_raw_smooth, data.Cluster_bot_mean_mag, data.Cluster_top_mean_mag, data.Clusters_distance, data.Template_response, data.LK_valid_count_smooth, data.LK_valid_count];
    TestingFeatures=[TestingFeatures;fv]; 
    TestingLabels=[TestingLabels;data.Labels];
end

ConvertedTestingLabels=[];
ConvertedTestingFeatures=[];
for i=1:size(TestingLabels,1),
    for j =1:size(activities,2),
         temp = findstr(char(activities(1,j)),char(TestingLabels(i)));
         if(~isempty(temp)),
             if(j==1)
                ConvertedTestingLabels=[ConvertedTestingLabels;1];
                ConvertedTestingFeatures=[ConvertedTestingFeatures;TestingFeatures(i,:)];
             elseif(j==2)
                ConvertedTestingLabels=[ConvertedTestingLabels;2];
                ConvertedTestingFeatures=[ConvertedTestingFeatures;TestingFeatures(i,:)];
             end
             break;
         end
     end
end




%% Train RDF

ConvertedTrainingFeatures = real(ConvertedTrainingFeatures);
ConvertedTestingFeatures = real(ConvertedTestingFeatures);
classificationAccuracy = [];
predicted = [];

for numTrees = 2000:1000:4000,
        B = TreeBagger(numTrees,ConvertedTrainingFeatures,ConvertedTrainingLabels,'Method','classification');
        response = predict(B,ConvertedTestingFeatures);
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
        numTrees
        correct = 0;
        for i=1:size(ConvertedTestingFeatures,1)
            %fprintf('response %g testUCI %g\n',predicted(i,1),testUCI(i,562));
            if (predicted(i,1)==ConvertedTestingLabels(i,1))
                correct = correct + 1;
            end
        end
        correct
        classificationAccuracy = [classificationAccuracy; numTrees , correct/size(ConvertedTestingLabels,1)];
            
        
end 

predicted= [];
[maxVal,ind]  = max(classificationAccuracy(:,2));
numTrees = classificationAccuracy(ind,1);
B = TreeBagger(numTrees,ConvertedTrainingFeatures,ConvertedTrainingLabels,'Method','classification');
response = predict(B,ConvertedTestingFeatures);
for i=1:size(response,1)
    predicted = [predicted; str2double(response{i,1})];
end
C = confusionmat(ConvertedTestingLabels,predicted);
performance = classperf(ConvertedTestingLabels,predicted);
X = performance.CountingMatrix;
 
