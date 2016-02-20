function [ feature_vector ] = getFeatures( sensor_data )
%getFeatures calculate the feature vector 
%   Detailed explanation goes here
%%fprintf('input size of sensor data is %g %g\n',size(sensor_data,1),size(sensor_data,2));
feature_vector = [];
%MEAN = 
for i=1:3
    feature_vector = [feature_vector, mean(sensor_data(:,i))];
    %fprintf('mean is %g\n', mean(sensor_data(:,i)));
end

%STANDARD DEVIATION
for i=1:3
    feature_vector = [feature_vector, std(sensor_data(:,i))];
    %fprintf('std is %g\n', std(sensor_data(:,i)));
end

%MEAN ABSOLUTE DEVIATION
for i=1:3
    feature_vector = [feature_vector, mad(sensor_data(:,i))];
    %fprintf('mad is %g\n', mad(sensor_data(:,i)));
end

%MAXIMUM
for i=1:3
    feature_vector = [feature_vector, max(sensor_data(:,i))];
    %fprintf('max is %g\n', max(sensor_data(:,i)));
end

%MINIMUM
for i=1:3
    feature_vector = [feature_vector, min(sensor_data(:,i))];
    %fprintf('min is %g\n', min(sensor_data(:,i)));
end

%SIGNAL MAGNITUDE AREA
feature_vector = [feature_vector, sma(sensor_data(:,:))];
%fprintf('sma is %g\n', sma(sensor_data(:,:)));

%ENERGY
for i=1:3
    squares = sensor_data(:,i).^2;
    feature_vector = [feature_vector, (sum(squares)/size(sensor_data,1))];
    %fprintf('energy is %g\n', (sum(squares)/size(sensor_data,1)));
end

%INTERQUARTILE RANGE
for i=1:3
    feature_vector = [feature_vector, iqr(sensor_data(:,i))];
    %fprintf('iqr is %g\n', iqr(sensor_data(:,i)));
end

%ENTROPY
for i=1:3
    feature_vector = [feature_vector, wentropy(sensor_data(:,i),'log energy')];
    %fprintf('entropy is %g\n', wentropy(sensor_data(:,i),'log energy'));
end

%AUTOREGRESSIVE COEFFECIENTS
for i=1:3
    feature_vector = [feature_vector, arburg(sensor_data(:,i),4)];
    %fprintf('autoregressive is %g\n', arburg(sensor_data(:,i),4));
end

%CORRELATION X,Y
R = corrcoef(sensor_data(:,1),sensor_data(:,2));
feature_vector = [feature_vector, R(1,2)];
%fprintf('corr x,y is %g\n', R(1,2));

%CORRELATION Y,Z
R = corrcoef(sensor_data(:,2),sensor_data(:,3));
feature_vector = [feature_vector, R(1,2)];
%fprintf('corr z,y is %g\n', R(1,2));

%CORRELATION X,Z
R = corrcoef(sensor_data(:,1),sensor_data(:,3));
feature_vector = [feature_vector, R(1,2)];
%fprintf('corr x,z is %g\n', R(1,2));


%FREQUENCY DOMAIN SIGNALS
X = fft(sensor_data(:,1));
Y = fft(sensor_data(:,2));
Z = fft(sensor_data(:,3));

sensorf_data = [X,Y,Z];

%MEAN = 
for i=1:3
    feature_vector = [feature_vector, mean(sensorf_data(:,i))];
    %fprintf('meanf is %g\n', mean(sensorf_data(:,i)));
end

%STANDARD DEVIATION
for i=1:3
    feature_vector = [feature_vector, std(sensorf_data(:,i))];
    %fprintf('stdf is %g\n', std(sensorf_data(:,i)));
end

%MEAN ABSOLUTE DEVIATION
for i=1:3
    feature_vector = [feature_vector, mad(sensorf_data(:,i))];
    %fprintf('madf is %g\n', mad(sensorf_data(:,i)));
end

%MAXIMUM
for i=1:3
    feature_vector = [feature_vector, max(sensorf_data(:,i))];
    %fprintf('maxf is %g\n', max(sensorf_data(:,i)));
end

%MINIMUM
for i=1:3
    feature_vector = [feature_vector, min(sensorf_data(:,i))];
    %fprintf('minf is %g\n', min(sensorf_data(:,i)));
end

%SIGNAL MAGNITUDE AREA
feature_vector = [feature_vector, sma(sensorf_data(:,:))];
%fprintf('smaf is %g\n', sma(sensorf_data(:,:)));

%ENERGY
for i=1:3
    squares = sensorf_data(:,i).^2;
    feature_vector = [feature_vector, (sum(squares)/size(sensor_data,1))];
    %fprintf('energyf is %g\n', (sum(squares)/size(sensor_data,1)));
end

%INTERQUARTILE RANGE
for i=1:3
    feature_vector = [feature_vector, iqr(sensorf_data(:,i))];
     %fprintf('iqr f is %g\n', iqr(sensorf_data(:,i)));
end

%ENTROPY
for i=1:3
    feature_vector = [feature_vector, wentropy(sensorf_data(:,i),'log energy')];
    %fprintf('entropy f is %g\n',  wentropy(sensorf_data(:,i),'log energy'));
end

%SKEWNESS
for i=1:3
    feature_vector = [feature_vector, skewness(sensorf_data(:,i))];
    %fprintf('skewness f is %g\n',  skewness(sensorf_data(:,i)));
end

%KURTOSIS
for i=1:3
    feature_vector = [feature_vector, kurtosis(sensorf_data(:,i))];
    %fprintf('kurtosis f is %g\n',  kurtosis(sensorf_data(:,i)));
end

end

