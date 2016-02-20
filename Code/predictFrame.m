function [phoneLabel2,watchLabel2,cameraLabel2] = predictFrame( phone,watch,camera,scene,columns )
 

%ANCHITA
%dataFolder = 'C:\Users\anchita12019\Dropbox\Major Project\ModelFile';

%SARTHAK
dataFolder = 'C:\Users\Sarthak\Dropbox\IIITDsem7\ML\Major Project\ModelFile';


%FOR PHONE RDF WORKS THE BEST
%STAGE 2
if scene==1
    load(strcat(dataFolder,'\IntraStaticPhoneRDF'));
    stage2model = B;
    predicted = [];
    response = predict(stage2model,real(phone));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
    phoneLabel2 = mode(predicted);
else
    load(strcat(dataFolder,'\IntraDYnamicPhoneRDF'));
    stage2model = B;
    predicted = [];
    response = predict(stage2model,real(phone));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
    phoneLabel2 = mode(predicted);
end



%FOR WATCH NB WORKS THE BEST

if scene==1
    load(strcat(dataFolder,'\IntraStaticWatchRDF'));
    stage2model = B;
    predicted = [];
    response = predict(stage2model,real(watch));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
    watchLabel2 = mode(predicted);
else
    load(strcat(dataFolder,'\IntraDYnamicWatchRDF'));
    stage2model = B;
    predicted = [];
    response = predict(stage2model,real(watch));
        for i=1:size(response,1)
            predicted = [predicted; str2double(response{i,1})];
        end
    watchLabel2 = mode(predicted);
end


%FOR CAMERA, RDF WORKS THE BEST

if scene==1
    load(strcat(dataFolder,'\IntraStaticCameraSVM'));
    stage2model = model;
    test_labels = ones(size(camera,1),1);
    [predicted_label, accuracy, decision_values] = svmpredict(test_labels, camera, model);
    cameraLabel2 = mode(predicted_label);
else
    load(strcat(dataFolder,'\IntraDynamicCameraSVM'));
    stage2model = model;
    test_labels = ones(size(camera,1),1);
    [predicted_label, accuracy, decision_values] = svmpredict(test_labels, camera, model);
    cameraLabel2 = mode(predicted_label);
end



end

