function [ impData] = extractImp( data)
%EXTRACTIMP Extracts Important Part of the Data after Displaying it to the
%User and Seeking his/her input.
%   dataA: the actual data
%   impDataA: important part of the data
%   dataG: the actual data
%   impDataG: important part of the data
%%2
    figure(1);clf;hold on;
    subplot(3,1,1); % first subplot  
    bar(data{1,2});hold on;
    title(data{1,5});

    subplot(3,1,2); % first subplot
    bar(data{1,3});hold on;
    title('Y');
    
    subplot(3,1,3); % first subplot
    bar(data{1,4});hold on;
    title('Z');  
       
    start = input('start point?: ');
    stop = input('end point?: ');
    
    impData = cell(1,5);
    impData{1,1}=data{1,1}(start:stop);
    impData{1,2}=data{1,2}(start:stop);
    impData{1,3}=data{1,3}(start:stop);
    impData{1,4}=data{1,4}(start:stop);
    impData{1,5}=data{1,5};

    figure(1);clf;hold on;
    subplot(3,1,1); % first subplot  
    bar(impData{1,2});hold on;
    title(data{1,5});

    subplot(3,1,2); % first subplot
    bar(impData{1,3});hold on;
    title('Y');
    
    subplot(3,1,3); % first subplot
    bar(impData{1,4});hold on;
    title('Z');  
  
    cool = input('Cool? (1/0): ');
    if(cool==0),
        impData = extractImp(data);
    end
end

