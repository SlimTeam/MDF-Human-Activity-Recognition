function [phoneLabel1,watchLabel1,cameraLabel1] = predictFrameTwoClass( phone,watch,camera,columns )
 

%ANCHITA
%dataFolder = 'C:\Users\anchita12019\Dropbox\Major Project\ModelFile';

%SARTHAK
dataFolder = 'C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\ModelFile';


%FOR PHONE RDF WORKS THE BEST
load(strcat(dataFolder,'\TwoClassPhoneRDF'));
%STAGE 1:
stage1model = B;
predicted = [];
response = predict(stage1model,real(phone));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
phoneLabel1 = mode(predicted);


%FOR WATCH NB WORKS THE BEST
load(strcat(dataFolder,'\TwoClassWatchNB'));
stage1model  = NBModel;


j = 0;
for i=1:size(columns,1)
     columns(i,1)-j
    
    watch(:,columns(i,1)-j)=[];
    j=j+1;
end
size(watch)
response = predict(stage1model,real(watch));
watchLabel1 = mode(response);

%FOR CAMERA, RDF WORKS THE BEST
load(strcat(dataFolder,'\TwoClassCameraRDF'));
stage1model  = B;
predicted = [];
response = predict(stage1model,camera);
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
cameraLabel1 = mode(predicted);


end

