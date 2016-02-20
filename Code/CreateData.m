%% Browse through Data Folder
% - For each folder in data folder call - extractData()
% - This returns 5 Labelled Cell Matrices (Last Column Represents Class Label)- 
% - - Smart Phone Accelerometer Data
% - - Smart Phone Gyrometer Data
% - - Smart Watch Accelerometer Data
% - - Smart Watch Gyrometer Data
%
%   Remaining Task:
% - - Averaging Data
% - - Calculating Features
%

% Running on Test Folder for now

% Sarthak
%dataFolder = 'C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\Data';

% Anchita
 dataFolder = 'F:\Dropbox\Major Project\Data';

 rawDataFolder = strcat(dataFolder,'\Raw Data');
 cleanDataFolder = strcat(dataFolder,'\Cleaned Data');
 contents = dir(rawDataFolder);   



% Containers
OF={};
SP_A={};
SP_G={};
SW_A={};
SW_G={};

% Iterate through each Person's Data
for i = 3:size(contents,1)
%     if exist(strcat(cleanDataFolder,'\',contents(i).name,'.mat'),'file')
%         continue;
%     end
    [SP_A, SP_G, SW_A, SW_G]=extractData(strcat(rawDataFolder,'\',contents(i).name));
    % Save it to files
    %save(strcat(cleanDataFolder,'\',contents(i).name,'.mat'), 'SP_A', 'SP_G', 'SW_A', 'SW_G');
    
end