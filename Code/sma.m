function [ val ] = sma( input )
%CALCULATE TEH SIGNAL MAGNITUDE AREA
%   http://dsp.stackexchange.com/questions/18649/signal-magnitude-area


%fprintf('input size of input is %g %g\n',size(input,1),size(input,2));
val = zeros(1,1);
for i=1:3
    temp = sum(abs(input(:,i)));
    val(1,1) = val(1,1) + temp;
end
val(1,1) = val(1,1)/(size(input,1));
    
    
    
     
end

