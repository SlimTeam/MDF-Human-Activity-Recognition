%% Taken from Huji Data Set
function [metadata] = ReadVid2OpticalFlowMetadata(lk_csv_filename)

    fileID = fopen(lk_csv_filename);
    line = textscan(fileID, '%s',1,'Delimiter','\n');
    fclose(fileID);

    line = cell2mat(line{1});
    [pairs] = textscan(line,'%s','Delimiter',',');

    metadata = containers.Map();

    for i=1:numel(pairs{1})
        [kvpair] = textscan(pairs{1}{i},'%s','Delimiter','=');
        metadata(kvpair{1}{1}) = kvpair{1}{2};
    end
end