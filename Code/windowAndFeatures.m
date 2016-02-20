function [ featureVector ] = windowAndFeatures( accel,gyro,windowSize )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    featureVector = [];
    accelSize = size(accel,1);
    gyroSize = size(gyro,1);
    windowSizeaccel = windowSize;
    windowSizegyro = windowSizeaccel * ceil(gyroSize/accelSize);
    windowAccelStart = 1;
    windowGyroStart = 1;
    while true
        if windowAccelStart+windowSizeaccel<accelSize && windowGyroStart+windowSizegyro<gyroSize
            windowVector = [getFeatures(accel(windowAccelStart:windowAccelStart + windowSizeaccel,:)),getFeatures(gyro(windowGyroStart:windowGyroStart + windowSizegyro,:))];
            windowAccelStart = windowAccelStart + floor(windowSizeaccel/2);
            windowGyroStart = windowGyroStart + floor(windowSizegyro/2);
            featureVector = [featureVector;windowVector];
        else
            windowVector = [getFeatures(accel(windowAccelStart:accelSize,:)),getFeatures(gyro(windowGyroStart:gyroSize,:))];
            featureVector = [featureVector;windowVector];
            break;
        end
        
        
        
    end
    
    


end

