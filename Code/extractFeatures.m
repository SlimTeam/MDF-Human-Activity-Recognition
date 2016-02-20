folder = 'C:\Users\anchita12019\Dropbox\Major Project\Data\Preprocessed Data';
toSavefolder =  'C:\Users\anchita12019\Dropbox\Major Project\Data\Final';
contents = dir(folder);

window_size = 40;
  for i=3:size(contents,1)
     
     load(strcat(folder,'\',contents(i).name));
     phone_Data = [];
    phone_label = {};
    watch_Data = [];
    watch_label = {};
      for j=1:size(SP_A,1)
         phone_accel = [];
         phone_gyro = [];
         phone_accel = [phone_accel,SP_A{j,2}(:,1)];
         phone_accel = [phone_accel,SP_A{j,3}(:,1)];
         phone_accel = [phone_accel,SP_A{j,4}(:,1)];
         phone_gyro = [phone_gyro,SP_G{j,2}(:,1)];
         phone_gyro = [phone_gyro,SP_G{j,3}(:,1)];
         phone_gyro = [phone_gyro,SP_G{j,4}(:,1)];
         data = windowAndFeatures(phone_accel,phone_gyro,window_size);
         phone_Data = [phone_Data;data];
         label = SP_A{j,5}
         labels = cell([size(data,1) 1]);
         [labels{1:size(data,1)}] = deal(label);
         
         phone_label = [phone_label;labels];
      end
     
     save (strcat(toSavefolder,'\Phone\',contents(i).name),'phone_Data','phone_label');
     
     
     for j=1:size(SW_A,1)
         watch_accel = [];
         watch_gyro = [];
         watch_accel = [watch_accel,SW_A{j,2}(:,1)];
         watch_accel = [watch_accel,SW_A{j,3}(:,1)];
         watch_accel = [watch_accel,SW_A{j,4}(:,1)];
         watch_gyro = [watch_gyro,SW_G{j,2}(:,1)];
         watch_gyro = [watch_gyro,SW_G{j,3}(:,1)];
         watch_gyro = [watch_gyro,SW_G{j,4}(:,1)];
         data = windowAndFeatures(watch_accel,watch_gyro,window_size);
         watch_Data = [watch_Data;data];
         label = SW_A{j,5}
         labels = cell([size(data,1) 1]);
         [labels{1:size(data,1)}] = deal(label);
         watch_label = [watch_label;labels];
     end
     
     save (strcat(toSavefolder,'\Watch\',contents(i).name),'watch_Data','watch_label');
     
  end
