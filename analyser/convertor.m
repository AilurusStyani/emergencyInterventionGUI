function varargout = convertor(varargin)
% CONVERTOR MATLAB code for convertor.fig
%      CONVERTOR, by itself, creates a new CONVERTOR or raises the existing
%      singleton*.
%
%      H = CONVERTOR returns the handle to a new CONVERTOR or the handle to
%      the existing singleton*.
%
%      CONVERTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERTOR.M with the given input arguments.
%
%      CONVERTOR('Property','Value',...) creates a new CONVERTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before convertor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to convertor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help convertor

% Last Modified by GUIDE v2.5 21-Oct-2019 14:18:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @convertor_OpeningFcn, ...
                   'gui_OutputFcn',  @convertor_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before convertor is made visible.
function convertor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to convertor (see VARARGIN)
global dataPath
global fileName
filePath = fullfile(dataPath,fileName);
if exist('filePath','Var') && ~isempty(filePath) && contains(filePath,'.mat')
    edfFilePath = strrep(filePath,'.mat','.edf');
    set(handles.filePath1,'String',edfFilePath)
    set(handles.filePath2,'String',edfFilePath)
    if ~exist(edfFilePath,'file')
        set(handles.pathLog1,'String','EYE DATA IS MISSING!')
        set(handles.pathLog1,'ForegroundColor',[1 0 0]);
    end
end
% Choose default command line output for convertor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes convertor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = convertor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in edf2asc.
function edf2asc_Callback(hObject, eventdata, handles)
% hObject    handle to edf2asc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edf2asc


% --- Executes on button press in asc2mat.
function asc2mat_Callback(hObject, eventdata, handles)
% hObject    handle to asc2mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of asc2mat



function filePath1_Callback(hObject, eventdata, handles)
% hObject    handle to filePath1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edf2ascLog,'String','');
set(handles.asc2matLog,'String','');
% Hints: get(hObject,'String') returns contents of filePath1 as text
%        str2double(get(hObject,'String')) returns contents of filePath1 as a double


% --- Executes during object creation, after setting all properties.
function filePath1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filePath1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filePath2 = get(handles.filePath2,'String');
if exist(filePath2,'file') == 2
    pathIsFile = true;
else
    pathIsFile = false;
end

if isempty(filePath2)
    filePath1 = get(handles.filePath1,'String');
    if isempty(filePath1)
        set(handles.pathLog2,'String','Please input the data path!');
        set(handles.pathLog2,'ForegroundColor',[1 0 0]);
        return
    else
        set(handles.filePath2,'String',filePath1);
        set(handles.pathLog2,'String','Is this way right?');
        set(handles.pathLog2,'ForegroundColor',[1 0 0]);
        return
    end
else
    functionPath = pwd;
    try
        if ~pathIsFile
            cd(filePath2);
        else
            file = dir(filePath2);
            cd(file(1).folder);
        end
        set(handles.pathLog2,'String','Start reading files.')
        set(handles.pathLog2,'ForegroundColor',[0.2 0.9 0]);
    catch
        set(handles.pathLog2,'String','Path error');
        set(handles.pathLog2,'ForegroundColor',[1 0 0]);
        return
    end
end
if pathIsFile
    dataFile = dir(filePath2);
    if ~contains(dataFile.name,'.mat')
        if contains(dataFile.name,'.edf')
            dataFile.name = strrep(dataFile.name,'.edf','.mat');
        else
            set(handles.pathLog2,'String','Path error');
            set(handles.pathLog2,'ForegroundColor',[1 0 0]);
            return
        end
    end
    if ~contains(dataFile.name,'Converted_')
        dataFile = dir(fullfile(dataFile.folder,['Converted_' dataFile.name]));
    end
else
    dirPath = pwd;
    cd(filePath2);
    dataFile = dir('Converted_*.mat');
    cd(dirPath);
end
fileName = cell(length(dataFile),1);
for i = 1:length(dataFile)
    fileName{i} = dataFile(i).name;
end
set(handles.fileList,'String',fileName)
cd(functionPath);
if pathIsFile
    fileList_Callback(hObject, eventdata, handles);
end
    

% --- Executes on selection change in fileList.
function fileList_Callback(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fileList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fileList
filePath2 = get(handles.filePath2,'String');
if isempty(filePath2)
    filePath1 = get(handles.filePath1,'String');
    if isempty(filePath1)
        set(handles.pathLog2,'String','Please input the data path!');
        set(handles.pathLog2,'ForegroundColor',[1 0 0]);
        return
    else
        set(handles.filePath2,'String',filePath1);
        set(handles.pathLog2,'String','Will work on displayed pathway.');
        set(handles.pathLog2,'ForegroundColor',[1 0 0]);
    end
else
    set(handles.pathLog2,'String',' ');
    set(handles.pathLog2,'ForegroundColor',[0.2 0.9 0]);
end

clear data
fileList = get(handles.fileList,'String');
fileNum = get(handles.fileList,'Value');
file = dir(filePath2);
fileName = fullfile(file(1).folder,fileList{fileNum});

data = load(fileName);
if ~isempty(data.eyeData)
    figure(1)
    cla;
    
    plot(data.eyeData(:,2),'r');
    hold on
    plot(data.eyeData(:,3),'g');
    plot(data.eyeData(:,4),'b');
    
    if ~isempty(data.trialStart)
        stIndex = ones(length(data.trialStart(:,1)),1);
        for i = 1:length(data.trialStart(:,1))
            stIndex(i) = find(data.trialStart(i,1) <= data.eyeData(:,1),1);
        end
        plot([stIndex stIndex],[0 8000],'--m');
    end
    
    if ~isempty(data.choiceMade)
        fbIndex = ones(length(data.choiceMade(:,1)),1);
        for i = 1:length(data.choiceMade(:,1))
            fbIndex(i) = find(data.choiceMade(i,1) <= data.eyeData(:,1),1);
        end
        plot([fbIndex fbIndex],[0 8000],'--k');
    end
else
    set(handles.pathLog2,'String','No eye data in this file.');
    set(handles.pathLog2,'ForegroundColor',[1 0 0]);
end

logFile = strrep(fileName,'Converted_','');
log = load(logFile);

st{1} = data.trialStart(:,1);
ed{1} = data.feedback(:,1);

lSt = length(st{1});
lEd = length(ed{1});
if lSt>lEd
    st{1} = st{1}(1:lEd);
elseif lEd>lSt
    ed{1} = ed{1}(1:lSt);
end
    
st{2} = data.trialStart(:,1)-200;
ed{2} = data.trialStart(:,1)+700;

% st{3} = data.movingStart(:,1)+log.clockTime(1:size(data.movingStart,1))'-500;
% ed{3} = data.movingStart(:,1)+log.clockTime(1:size(data.movingStart,1))'+500;
st{3} = data.choiceMade(:,1)-1000;
ed{3} = data.choiceMade(:,1)+500;

for i = 1:length(ed)
    figure(1+i);cgf
    hold off
    pupilSize = nan(max(ed{i}-st{i}),length(st{i}));
    for j = 1:length(st{i})-1
        sP = find(data.eyeData(:,1) >= st{i}(j),1);
        basement = mean(data.eyeData(sP:sP+100,4));
        eP = find(data.eyeData(:,1) <= ed{i}(j),1,'last');
        [purifiedPathData,~,errorflag,~] = BlinkNoisePurify_NaN(data.eyeData(sP:eP,:),1,[3 7 8 9 10],4);
        if ismember(0,errorflag)
            pupilSize(1:eP-sP+1,j) = (purifiedPathData(:,4)-basement)/basement;
        else
            pupilSize(1:eP-sP+1,j) = nan(eP-sP,1);
        end
    end
    speedUpTrial = log.result(:,2) == 1;
    brakeTrial = log.result(:,2) == 2;
    
    pupilSizeSU = pupilSize(:,speedUpTrial)';
    pMeanSU = nanmean(pupilSizeSU,1);
    pSeSU = nanstd(pupilSizeSU,1)./sqrt(sum(~isnan(pupilSizeSU),1));
    shadedErrorBar(1:size(pupilSizeSU,2),pMeanSU,pSeSU,'lineprops', '-g');
    hold on
    plot(pupilSizeSU','color',[0 1 0 0.25]);
    
    pupilSizeB = pupilSize(:,brakeTrial)';
    pMeanB = nanmean(pupilSizeB,1);
    pSeB = nanstd(pupilSizeB,1)./sqrt(sum(~isnan(pupilSizeB),1));
    shadedErrorBar(1:size(pupilSizeB,2),pMeanB,pSeB,'lineprops', '-r');
    plot(pupilSizeB','color',[1 0 0 0.25]);
    
    minPlot = min(min(pMeanB-pSeB*3),min(pMeanSU-pSeSU*3));
    maxPlot = max(max(pMeanB+pSeB*3),max(pMeanSU+pSeSU*3));
    if i == 1
        title('During the trial for BK vs SU');
    elseif i == 2
        title('In trial begining for BK vs SU');
        plot([200 200],[minPlot,maxPlot],'-.k');
    elseif i == 3
        title('During choice for BK vs SU')
        plot([1000 1000],[minPlot,maxPlot],'-.k');
    end
    
    figure(length(ed)+1+i);
    
    % may need update for different degree design
    dangerTrial = and(log.Conditions(:,3) >= 50,log.Conditions(:,3) <= 65); 
    
    if length(dangerTrial) > size(pupilSize,2)
        dangerTrial(end-(length(dangerTrial)-size(pupilSize,2))+1:end) = [];
    end
    safeTrial = ~dangerTrial;
    
    pupilSizeSF = pupilSize(:,safeTrial')';
    pMeanSF = nanmean(pupilSizeSF,1);
    pSeSF = nanstd(pupilSizeSF,1)./sqrt(sum(~isnan(pupilSizeSF),1));
    shadedErrorBar(1:size(pupilSizeSF,2),pMeanSF,pSeSF,'lineprops', '-g');
    hold on
    plot(pupilSizeSF','color',[0 1 0 0.25]);
    
    pupilSizeD = pupilSize(:,dangerTrial')';
    pMeanD = nanmean(pupilSizeD,1);
    pSeD = nanstd(pupilSizeD,1)./sqrt(sum(~isnan(pupilSizeD),1));
    shadedErrorBar(1:size(pupilSizeD,2),pMeanD,pSeD,'lineprops', '-r');
    plot(pupilSizeD','color',[1 0 0 0.25]);
    
    minPlot = min(min(pMeanD-pSeD*3),min(pMeanSF-pSeSF*3));
    maxPlot = max(max(pMeanD+pSeD*3),max(pMeanSF+pSeSF*3));
    if i == 1
        title('During the trial for S vs D');
    elseif i == 2
        title('In trial begining for S vs D');
        plot([200 200],[minPlot,maxPlot],'-.k');
    elseif i == 3
        title('During choice for S vs D')
        plot([1000 1000],[minPlot,maxPlot],'-.k');
    end
end






% --- Executes during object creation, after setting all properties.
function fileList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filePath1 = get(handles.filePath1,'String');
edf2asc = get(handles.edf2asc,'Value');
if exist(filePath1,'file')==2 && contains(filePath1,'.edf')
    pathIsFile = true;
else
    pathIsFile = false;
end

if isempty(filePath1)
    set(handles.pathLog1,'String','You need to input file path before start!')
    set(handles.pathLog1,'ForegroundColor',[1 0 0]);
    return
else
    functionPath = pwd;
    exePath = fullfile(functionPath,'edf2asc.exe');
    exeCmd = [exePath ' -ntime_chcek'];
    
    if ~pathIsFile
        try
            cd(filePath1);
            set(handles.pathLog1,'String','Convert in processing...')
            set(handles.pathLog1,'ForegroundColor',[0.2 0.9 0]);
        catch
            set(handles.pathLog1,'String','Path error');
            set(handles.pathLog1,'ForegroundColor',[1 0 0]);
            return
        end
    else
        set(handles.pathLog1,'String','Convert in processing...')
        set(handles.pathLog1,'ForegroundColor',[0.2 0.9 0]);
    end
end

if edf2asc
    if ~pathIsFile
        edfFiles = dir('*.edf');
        edfFileNum = length(edfFiles);
    else
        edfFiles = dir(filePath1);
        edfFileNum = length(edfFiles);
        cd(edfFiles.folder);
    end
    
    wb1 = waitbar(0,'.EDF to .ASC in processing... 0%','CreateCancelBtn','closereq;return;');
    
    for i = 1:edfFileNum
        edfNamei = edfFiles(i).name;
        ascNamei = strrep(edfNamei,'.edf','.asc');
        edfPathi = fullfile(edfFiles(i).folder,edfNamei);
        if exist(ascNamei,'file')
            delete(ascNamei)
        end
        cmd = [exeCmd 32 edfPathi];
        system(cmd);
        
        waitbar(i/edfFileNum,wb1,['.EDF to .ASC in processing... ' num2str(i/edfFileNum*100) '%']);
    end
    delete(wb1);
end

asc2mat = get(handles.asc2mat,'Value');
if asc2mat
    if ~pathIsFile
        cd(filePath1)
        ascFile = dir('*.asc');
        ascFileNum = length(ascFile);
    else
        ascFile = dir(strrep(filePath1,'.edf','.asc'));
        ascFileNum = length(ascFile);
        cd(ascFile.folder);
    end
    
    wb2 = waitbar(0,'.ASC to .MAT in processing... 0%','CreateCancelBtn','closereq;return;');
    
    for i = 1:ascFileNum
        ascNamei = ascFile(i).name;
        saveNamei = ['Converted_' strrep(ascNamei,'.asc','.mat')];
        
        if exist(saveNamei,'file')
            delete(saveNamei)
        end
        
        fid = fopen(ascNamei);
        fseek(fid,0,'eof');
        numline=ftell(fid);
        fclose(fid);
        rawData=importdata(ascNamei,' ',numline);
        
        stStr = rawData(and(contains(rawData,'trial','IgnoreCase',true),contains(rawData,'start','IgnoreCase',true)));
        trialStart = nan(length(stStr),2);
        for j = 1:length(stStr)
            trialStart(j,:) = cell2mat(cellfun(@str2num,regexp(stStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(trialStart(:,2))==0;
        trialStart(delIndex,:) = [];
        
        
        cmStr = rawData(contains(rawData,'Choice made','IgnoreCase',true));
        choiceMade = nan(length(cmStr),3);
        for j = 1:length(cmStr)
             array = cell2mat(cellfun(@str2num,regexp(cmStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
             if length(array) == 2
                 array = [array(1) 0 array(2)];
             end
             choiceMade(j,:) = array;
        end
        delIndex = diff(choiceMade(:,3))==0;
        choiceMade(delIndex,:) = [];
        
        fbStr = rawData(contains(rawData,'Feedback given','IgnoreCase',true));
        feedback = nan(length(fbStr),2);
        for j = 1:length(fbStr)
            feedback(j,:) = cell2mat(cellfun(@str2num,regexp(fbStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(feedback(:,2))==0;
        feedback(delIndex,:) = [];
        
        eyeDataInd = contains(rawData,'...');
        eyeData = rawData(eyeDataInd);
        eyeData = cell2mat(cellfun(@str2num,strrep(eyeData,'...',''),'UniformOutput',false));
        
        save(saveNamei,'eyeData','trialStart','choiceMade','feedback')
        
        waitbar(i/ascFileNum,wb2,['.ASC to .MAT in processing... ' num2str(i/ascFileNum*100) '%']);
    end
    delete(wb2);
end
if exist('edfFileNum','Var')
    fileNum = edfFileNum;
elseif exist('ascFileNum','Var')
    fileNum = ascFileNum;
else
    fileNum = 0;
end
set(handles.pathLog1,'String',['Mission complete, ' num2str(fileNum) ' files converted.'])
set(handles.pathLog1,'ForegroundColor',[0.2 0.9 0]);
set(handles.filePath2,'String',filePath1);
cd(functionPath);



function filePath2_Callback(hObject, eventdata, handles)
% hObject    handle to filePath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filePath2 as text
%        str2double(get(hObject,'String')) returns contents of filePath2 as a double


% --- Executes during object creation, after setting all properties.
function filePath2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filePath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path = uigetdir(pwd);
set(handles.filePath1,'String',path);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path = uigetdir(pwd);
set(handles.filePath2,'String',path);
