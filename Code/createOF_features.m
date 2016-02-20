function [ data ] = createOF_features( CSV, ELAN )
%CREATEOF_FEATURES Extract Gyrometer data of Smart Watch (SW) from file.
%   CSV: Optical Flow
%   ELAN: Ground Truth Data
    viddata = ReadLoadLKFromVid2OpticalFlowCSV(CSV);
    mapping=[];
    viddata.ground_truth_data = ElanHelper.LoadFile(ELAN,viddata.fps,viddata.num_frames,'Event',mapping);
    fullname = 'test';
    
    data = SequenceData(viddata,fullname);
    
end