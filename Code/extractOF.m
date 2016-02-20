function [ OF ] = extractOF( folder )
%EXTRACTOF Extracts Optical Flow from Files in the folder
%   folder: Path of Camera Folder inside Name Folder
    OF={};
    run('GLOBAL.m');
    display(folder); 

    CSVfolder=strcat(folder,'\CSV');
    ELANfolder=strcat(folder,'\ELAN');
    
    contents = dir(CSVfolder);
    
    % Iterate through each Activity's Data
    for i = 3:size(contents,1),
        name=contents(i).name(1:size(contents(i).name,2)-4);
        namel=name(1:end-4);
        namel=strcat(namel(1:4),'O',namel(6:end))
        name
        strcat(ELANfolder,'\',namel,'.eaf')
        strcat(CSVfolder,'\',name,'.csv')
        data = createOF_features(strcat(CSVfolder,'\',name,'.csv'),strcat(ELANfolder,'\',namel,'.eaf'));
        OF=[OF;data];
    end
end

