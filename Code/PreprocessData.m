folder = 'F:\Dropbox\Major Project\Data\Cleaned Data';
finalFolder = 'F:\Dropbox\Major Project\Data\Preprocessed Data';
contents = dir(folder); 

 for i=3:size(contents,1)
     
        
    %DO SOMETHING FOR OPTICAL FLOOR
    
    %SMARTHPHONE DATA
    load(strcat(folder,'\',contents(i).name));
     for rows = 1:size(SP_A,1)
          for j=2:4
             SP_A{rows,j} = medfilt1(SP_A{rows,j}(:,1),4);
         end
     end
    for rows = 1:size(SP_G,1)
          for j=2:4
             SP_G{rows,j} = medfilt1(SP_G{rows,j}(:,1),4);
         end
    end
    for rows = 1:size(SW_A,1)
          for j=2:4
             SW_A{rows,j} = medfilt1(SW_A{rows,j}(:,1),4);
         end
    end
    for rows = 1:size(SW_G,1)
          for j=2:4
             SW_G{rows,j} = medfilt1(SW_G{rows,j}(:,1),4);
         end
    end
    save(strcat(finalFolder,'\',contents(i).name),'OF', 'SP_A', 'SP_G', 'SW_A', 'SW_G');
        
    
end

    
