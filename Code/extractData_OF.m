function [ OF ] = extractData_OF( folder )
%EXTRACTDATA_OF Extracts OPTICAL FLOW Data From Given Folder and Organizes it into Matrices
%   folder: Name of Person Folder
%   OF: Cell Matrix with Labelled Optical Flow Data

    display(folder);
    
    folder_OF = strcat(folder,'\Camera');
    OF = extractOF ( folder_OF );
end
