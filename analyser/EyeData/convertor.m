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
        cd(filePath2);
        set(handles.pathLog2,'String','Start reading files.')
        set(handles.pathLog2,'ForegroundColor',[0.2 0.9 0]);
    catch
        set(handles.pathLog2,'String','Path error');
        set(handles.pathLog2,'ForegroundColor',[1 0 0]);
        return
    end
end

dataFile = dir(fullfile(filePath2,'Converted_*.mat'));
fileName = cell(length(dataFile),1);
for i = 1:length(dataFile)
    fileName{i} = dataFile(i).name;
end
set(handles.fileList,'String',fileName)
cd(functionPath);
    

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

fileList = get(handles.fileList,'String');
fileNum = get(handles.fileList,'Value');
fileName = fullfile(filePath2,fileList{fileNum});

clear data
data = load(fileName);

if ~isempty(data.eyeData)
    figure(1)
    cla;
    
    plot(data.eyeData(:,2),'r');
    hold on
    plot(data.eyeData(:,3),'g');
    plot(data.eyeData(:,4),'b');
    
    if ~isempty(data.stimulusOnset)
        soIndex = ones(length(data.stimulusOnset(:,1)),1);
        for i = 1:length(data.stimulusOnset(:,1))
            soIndex(i) = find(data.stimulusOnset(i,1) <= data.eyeData(:,1),1);
        end
        plot([soIndex soIndex],[0 8000],'--m');
    end
    
    if ~isempty(data.stimulusTerm)
        stIndex = ones(length(data.stimulusTerm(:,1)),1);
        for i = 1:length(data.stimulusTerm(:,1))
            stIndex(i) = find(data.stimulusTerm(i,1) <= data.eyeData(:,1),1);
        end
        plot([stIndex stIndex],[0 8000],'--k');
    end
else
    set(handles.pathLog2,'String','No eye data in this file.');
    set(handles.pathLog2,'ForegroundColor',[1 0 0]);
end

logFile = strrep(fileName,'Converted_','');
log = load(logFile);

st{1} = data.movingStart(:,1);
ed{1} = data.startChoice(:,1);

st{2} = data.clockClick(:,1)-500;
ed{2} = data.clockClick(:,1)+500;

st{3} = data.movingStart(:,1)+log.clockTime(1:size(data.movingStart,1))'-500;
ed{3} = data.movingStart(:,1)+log.clockTime(1:size(data.movingStart,1))'+500;

for i = 1:length(st)
    figure(1+i);cgf
    hold off
    pupilSize = nan(max(ed{i}-st{i}),length(st{i}));
    for j = 1:length(st{i})
        sP = find(data.eyeData(:,1) >= st{i}(j),1);
        if i == 1
            basement = mean(data.eyeData(sP-100:sP,4));
        end
        eP = find(data.eyeData(:,1) <= ed{i}(j),1,'last');
        pupilSize(1:eP-sP+1,j) = (data.eyeData(sP:eP,4)-basement)/basement;
    end
    pupilSize = pupilSize';
    pMean = nanmean(pupilSize,1);
    pSe = nanstd(pupilSize,1)./sqrt(sum(~isnan(pupilSize),1));
    shadedErrorBar(1:size(pupilSize,2),pMean,pSe);
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

if isempty(filePath1)
    set(handles.pathLog1,'String','You need to input file path before start!')
    set(handles.pathLog1,'ForegroundColor',[1 0 0]);
    return
else
    functionPath = pwd;
    exePath = fullfile(functionPath,'edf2asc.exe');
    exeCmd = [exePath ' -ntime_chcek'];
    
    try
        cd(filePath1);
        set(handles.pathLog1,'String','Convert in processing...')
        set(handles.pathLog1,'ForegroundColor',[0.2 0.9 0]);
    catch
        set(handles.pathLog1,'String','Path error');
        set(handles.pathLog1,'ForegroundColor',[1 0 0]);
        return
    end
end

if edf2asc
    edfFiles = dir('*.edf');
    edfFileNum = length(edfFiles);
    
    wb1 = waitbar(0,'.EDF to .ASC in processing... 0%','CreateCancelBtn','closereq;return;');
    
    for i = 1:edfFileNum
        edfNamei = edfFiles(i).name;
        ascNamei = strrep(edfNamei,'.edf','.asc');
        edfPathi = fullfile(filePath1,edfNamei);
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
    ascFile = dir('*.asc');
    ascFileNum = length(ascFile);
    
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
        
        foStr = rawData(contains(rawData,'fixation onset','IgnoreCase',true));
        fixationOnset = nan(length(foStr),2);
        for j = 1:length(foStr)
            fixationOnset(j,:) = cell2mat(cellfun(@str2num,regexp(foStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(fixationOnset(:,2))==0;
        fixationOnset(delIndex,:) = [];
        
        fdStr = rawData(contains(rawData,'fixation done','IgnoreCase',true));
        fixationDone = nan(length(fdStr),2);
        for j = 1:length(fdStr)
            fixationDone(j,:) = cell2mat(cellfun(@str2num,regexp(fdStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(fixationDone(:,2))==0;
        fixationDone(delIndex,:) = [];
        
        soStr = rawData(contains(rawData,'stimulus onset','IgnoreCase',true));
        stimulusOnset = nan(length(soStr),2);
        for j = 1:length(soStr)
            stimulusOnset(j,:) = cell2mat(cellfun(@str2num,regexp(soStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(stimulusOnset(:,2))==0;
        stimulusOnset(delIndex,:) = [];
        
        tbStr = rawData(contains(rawData,'trial break','IgnoreCase',true));
        trialBreak = nan(length(tbStr),2);
        for j = 1:length(tbStr)
            trialBreak(j,:) = cell2mat(cellfun(@str2num,regexp(tbStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        trialBreak;
        
        stStr = rawData(contains(rawData,'stimulus term','IgnoreCase',true));
        stimulusTerm = nan(length(stStr),2);
        for j = 1:length(stStr)
            stimulusTerm(j,:) = cell2mat(cellfun(@str2num,regexp(stStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(stimulusTerm(:,2))==0;
        stimulusTerm(delIndex,:) = [];
        
        msStr = rawData(contains(rawData,'Moving start','IgnoreCase',true));
        movingStart = nan(length(msStr),2);
        for j = 1:length(msStr)
            movingStart(j,:) = cell2mat(cellfun(@str2num,regexp(msStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(movingStart(:,2))==0;
        movingStart(delIndex,:) = [];
        
        scStr = rawData(contains(rawData,'start choice','IgnoreCase',true));
        startChoice = nan(length(scStr),2);
        for j = 1:length(scStr)
            startChoice(j,:) = cell2mat(cellfun(@str2num,regexp(scStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(startChoice(:,2))==0;
        startChoice(delIndex,:) = [];
        
        ccStr = rawData(contains(rawData,'clock click','IgnoreCase',true));
        clockClick = nan(length(ccStr),2);
        for j = 1:length(ccStr)
            clockClick(j,:) = cell2mat(cellfun(@str2num,regexp(ccStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(clockClick(:,2))==0;
        clockClick(delIndex,:) = [];
        
        dmStr = rawData(contains(rawData,'decision made','IgnoreCase',true));
        decisionMade = nan(length(dmStr),3);
        for j = 1:length(dmStr)
            decisionMade(j,:) = cell2mat(cellfun(@str2num,regexp(dmStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(decisionMade(:,2))==0;
        decisionMade(delIndex,:) = [];
        
        teStr = rawData(contains(rawData,'trial end','IgnoreCase',true));
        trialEnd = nan(length(teStr),2);
        for j = 1:length(teStr)
            trialEnd(j,:) = cell2mat(cellfun(@str2num,regexp(teStr{j},'\d*\.?\d*','match'),'UniformOutput',false));
        end
        delIndex = diff(trialEnd(:,2))==0;
        trialEnd(delIndex,:) = [];
        
        eyeDataInd = contains(rawData,'...');
        eyeData = rawData(eyeDataInd);
        eyeData = cell2mat(cellfun(@str2num,strrep(eyeData,'...',''),'UniformOutput',false));
        
        save(saveNamei,'eyeData','trialEnd','decisionMade','startChoice','stimulusTerm','trialBreak','stimulusOnset',...
            'fixationDone','fixationOnset','clockClick','movingStart')
        
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
