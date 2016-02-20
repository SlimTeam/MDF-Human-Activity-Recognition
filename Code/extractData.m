function [SP_A, SP_G, SW_A, SW_G ] = extractData( folder )
%EXTRACTDATA Extracts Data From Given Folder and Organizes it into Matrices
%   folder: Name of Person Folder
%   OF: Cell Matrix with Labelled Optical Flow Data
%   SP_A: Cell Matrix with Labelled Smart Phone Accelerometer Data
%   SP_G: Cell Matrix with Labelled Smart Phone Gyrometer Data
%   SW_A: Cell Matrix with Labelled Smart Watch Accelerometer Data
%   SW_G: Cell Matrix with Labelled Smart Watch Gyrometer Data

    display(folder);
    
    folder_SP_A = strcat(folder,'\Accelerometer');
    folder_SP_G = strcat(folder,'\Gyrometer');
    file_SW_A = strcat(folder,'\watch_accel.txt');
    file_SW_G = strcat(folder,'\watch_gyro.txt');
    SP_A = extractSP_A ( folder_SP_A );
    SP_G = extractSP_G ( folder_SP_G );
    SW_A = extractSW_A ( file_SW_A );
    SW_G = extractSW_G (file_SW_G );
end

