function [ featureVec ] = makeWindowsAndExtractfeatureMhealth( raw_data )

        windowSize = 50;
        windowStartindex = 1;
        totalSize = size(raw_data,1);
        overlap = windowSize/2;
        featureVec = [];
        windowData = [];
        %fprintf('input size of raw data is %g %g\n',size(raw_data,1),size(raw_data,2));
        while true
            if windowStartindex + windowSize < totalSize
                featureVec = [featureVec;getFeatures(raw_data(windowStartindex:windowStartindex + windowSize,:))];
                windowStartindex = windowStartindex + overlap;
            else
                featureVec = [featureVec;getFeatures(raw_data(windowStartindex:totalSize,:))];
                break;
            end
            
        end
        
 
end

