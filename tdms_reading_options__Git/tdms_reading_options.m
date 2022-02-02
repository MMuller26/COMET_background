%Code: https://www.mathworks.com/matlabcentral/fileexchange/30023-tdms-reader

file_path = 'D:\repos\SVN_FOLDERS\Labview\TDT_Controller\Modules\ENG Recorder\Data\Block-003_ENG.tdms';

%TDMS file and index at (download index to speed up reading)
%https://drive.google.com/drive/folders/1iiwPMvn5l5nrMOwrt5sSBYrCm7SyJAi1?usp=sharing

%This file contains:
%/'Data'/'Trigger'
%/'Data'/'Distal'
%/'Data'/'Proximal'


og = struct; 
og.fullPathsKeep = {'/''Data''/''Trigger'''}; 

%Get Trigger data in one pass
%-----------------------------------------
%Based on looking through TDMS_handleGetDataOption
tic
data = TDMS_getStruct(file_path,4,{'GET_DATA_OPTION','getsubset','OBJECTS_GET',og});
toc

%Read meta data then get more data later ...
%--------------------------------------------------
%Only get the meta data - we can then read more info later
tic
[~,m] = TDMS_readTDMSFile(file_path,'GET_DATA_OPTION','getnone');
toc

tic
%Pass in the previously parsed meta data - speeds up reading
temp = TDMS_readTDMSFile(file_path,'META_STRUCT',m,'GET_DATA_OPTION','getsubset','OBJECTS_GET',og);
data = TDMS_dataToGroupChanStruct_v4(temp);
toc

%OR - this combines the two calls above readTDMSFile and dataToGroupChanStruct_v4
tic
data = TDMS_getStruct(file_path,4,{'META_STRUCT',m,'GET_DATA_OPTION','getsubset','OBJECTS_GET',og});
toc

%Get the proximal and distal channels reusing the meta data parsing ...
og.fullPathsKeep = {'/''Data''/''Proximal''' '/''Data''/''Distal'''}; 
data2 = TDMS_getStruct(file_path,4,{'META_STRUCT',m,'GET_DATA_OPTION','getsubset','OBJECTS_GET',og});

%THe actual proximal data - need to dive down - note this shows us
%the group name ('Data') and channel name ('Proximal')
prox = data2.Data.Proximal.data;


%Read only the 'Data' group - this doesn't make much sense for this
%file because we only have a 'Data' group
og = struct;
og.groupsKeep = 'Data';
data = TDMS_getStruct(file_path,4,{'GET_DATA_OPTION','getsubset','OBJECTS_GET',og});

%Subset retrieval
%-------------------------------------------------------------
og = struct;
og.fullPathsKeep = {'/''Data''/''Trigger'''}; 
n_data_trigger = m.numberDataPoints(strcmp(og.fullPathsKeep{1},m.objectNameList));
%2237789

start_index = 10000;
%Note this relies on SUBSET_IS_LENGTH=true which is the default
n_samples_get = 50000;
subset_get = [start_index n_samples_get];
data3 = TDMS_getStruct(file_path,4,{'META_STRUCT',m,'GET_DATA_OPTION','getsubset','OBJECTS_GET',og,'SUBSET_GET',subset_get});

plot(data.Data.Trigger.data)
hold on
plot(subset_get(1):subset_get(1)+subset_get(2)-1,data3.Data.Trigger.data)
hold off

%subset_get applies to multiple channels
og = struct;
og.fullPathsKeep = {'/''Data''/''Trigger''' '/''Data''/''Distal'''};
%Now we are going to make the 2nd index a stop...
subset_get = [100000 400000];
data3 = TDMS_getStruct(file_path,4,{'META_STRUCT',m,'GET_DATA_OPTION','getsubset','OBJECTS_GET',og,'SUBSET_GET',subset_get,'SUBSET_IS_LENGTH',false});

subplot(2,1,1)
plot(data.Data.Trigger.data)
hold on
plot(subset_get(1):subset_get(2),data3.Data.Trigger.data)
hold off

subplot(2,1,2)
plot(data2.Data.Distal.data)
hold on
plot(subset_get(1):subset_get(2),data3.Data.Distal.data)
hold off

%Now let's retrieve different ranges from different channels
%---------------------------------------------------------------
gi = struct;
gi(1).group = 'Data';
gi(1).channel = 'Trigger';
gi(1).indices = [1e5 2e5]; %start and stop indices - subset_is_length is false
gi(2).group = 'Data';
gi(2).channel = 'Distal';
gi(2).indices = [2e5 3e5];

%'GET_DATA_OPTION','getsubset' <= remove this, just leave as normal
data4 = TDMS_getStruct(file_path,4,{'META_STRUCT',m,'GET_INDICES',gi,'SUBSET_IS_LENGTH',false});


subplot(2,1,1)
plot(data.Data.Trigger.data)
hold on
plot(1e5:2e5,data4.Data.Trigger.data)
hold off

subplot(2,1,2)
plot(data2.Data.Distal.data)
hold on
plot(2e5:3e5,data4.Data.Distal.data)
hold off

