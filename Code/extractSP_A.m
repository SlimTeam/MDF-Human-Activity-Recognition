function [ SP_A ] = extractSP_A( folder )
%EXTRACTSP_G Extract Accelerometer Data of Smart Phone from folder
%   folder: Path of Accelerometer Folder inside Name Folder

    SP_A={};
    run('GLOBAL.m');
    display(folder);
    contents = dir(folder);   

    % Iterate through each Activity's Data
    for i = 3:size(contents,1),
        fid = fopen(strcat(folder,'\',contents(i).name));
        data=textscan(fid,'%s %f %f %f','delimiter',' ');
        % Determine Activity
        activity='';
        for j =1:size(activities,2),
            temp = findstr(char(activities(1,j)),contents(i).name);
            if(~isempty(temp)),
                activity=activities(1,j);
                break;
            end
        end
        % Add Activity Label
        data{1,5}=activity;
        
        % Filter to get only mid 80% Data
        data=extractImp(data);
        
        fclose(fid);
        SP_A=[SP_A;data];
    end
end
