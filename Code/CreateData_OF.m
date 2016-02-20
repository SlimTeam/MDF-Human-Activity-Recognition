%% Browse through Data Folder
% - For each folder in data folder call - extractOF_features()
% - This returns 1 Labelled Cell Matrix (Last Column Represents Class Label)- 
% - - Optical Flow Data
%
%   Remaining Task:
% - - Averaging Data
% - - Calculating Features
%

% Running on Test Folder for now

% Sarthak
dataFolder = 'C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data';

% Anchita
%dataFolder = 'F:\Dropbox\Major Project\Data';

rawDataFolder = strcat(dataFolder,'\Raw Data');
cleanDataFolder = strcat(dataFolder,'\Cleaned Data');
contents = dir(rawDataFolder);   

% Containers
OF={};

% Iterate through each Person's Data
for i = 3:size(contents,1)
    if exist(strcat(cleanDataFolder,'\',contents(i).name,'_OF.mat'),'file')
        continue;
    end
    [OF]=extractData_OF(strcat(rawDataFolder,'\',contents(i).name));
    % Save it to files
    save(strcat(cleanDataFolder,'\',contents(i).name,'_OF.mat'),'OF');
end