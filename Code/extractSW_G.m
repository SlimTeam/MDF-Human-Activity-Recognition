function [ SW_G ] = extractSW_G( file )
%EXTRACTSW_A Extract Gyrometer data of Smart Watch (SW) from file.
%   file: Path of Gyrometer File inside Name Folder
%   SW_G: Cell Matrix of Labelled Smart Watch Gyrometer Data
    SW_G={};
    run('GLOBAL.m');
    display(file);

    % Iterate through the Smart Watch File
    fid = fopen(file);
    
    data=cell(1,4);
    tline = fgets(fid);
    activity='';
    firsttime=true;
    while ischar(tline)
         %disp(tline);
        % Add Line to data
        % Determine Activity
         flag=0;
         for j =1:size(activities,2),
             temp = findstr(char(activities(1,j)),tline);
             if(~isempty(temp)),
                 activity=activities(1,j);
                 if(firsttime),
                 else
                    flag=1;
                 end
                 break;
             end
         end
         if(flag==0 && ~firsttime),
             temp=strsplit(tline,' ');
             % size(temp,2)
             if(size(temp,2)==4),
                 data{1,1}=[data{1,1};temp(1)];
                 data{1,2}=[data{1,2};str2double(temp(2))];
                 data{1,3}=[data{1,3};str2double(temp(3))];
                 data{1,4}=[data{1,4};str2double(temp(4))];
                 data{1,5}=activity;
             end
             % data
         elseif firsttime,
             firsttime=false;
         else
             % Filter to get only mid 80% Data
             data=extractImp(data);
        
             SW_G=[SW_G;data];
             % SW_A
             data=cell(1,4);
         end
         
        
        tline = fgets(fid);
    end
    data=extractImp(data);
    SW_G=[SW_G;data];
    fclose(fid);
end
    


