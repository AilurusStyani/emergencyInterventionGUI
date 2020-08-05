function varargout = psychoAnalyzer(varargin)
% PSYCHOANALYZER MATLAB code for psychoAnalyzer.fig
%      PSYCHOANALYZER, by itself, creates a new PSYCHOANALYZER or raises the existing
%      singleton*.
%
%      H = PSYCHOANALYZER returns the handle to a new PSYCHOANALYZER or the handle to
%      the existing singleton*.
%
%      PSYCHOANALYZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSYCHOANALYZER.M with the given input arguments.
%
%      PSYCHOANALYZER('Property','Value',...) creates a new PSYCHOANALYZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before psychoAnalyzer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to psychoAnalyzer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help psychoAnalyzer

% Last Modified by GUIDE v2.5 05-Aug-2020 12:52:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @psychoAnalyzer_OpeningFcn, ...
                   'gui_OutputFcn',  @psychoAnalyzer_OutputFcn, ...
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

% --- Executes just before psychoAnalyzer is made visible.
function psychoAnalyzer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to psychoAnalyzer (see VARARGIN)

% Choose default command line output for psychoAnalyzer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using psychoAnalyzer.
% if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
% end

% UIWAIT makes psychoAnalyzer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = psychoAnalyzer_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axesSubject);
cla;
clear subjInfo
dataPath = get(handles.dataPath,'String');

subjectName = get(handles.subjectName,'String');
subjectI = get(handles.subjectName,'Value');
subjectTime = get(handles.subjectTime,'String');
timeI = get(handles.subjectTime,'Value');
fileNameSub = string(strjoin([subjectName(subjectI),subjectTime(timeI)]));
fileNameSub = strrep(fileNameSub,' ','');

if ~isempty(dataPath) && ~isempty(fileNameSub)
    edfFilesIndex = dir(fullfile(dataPath,'*.edf')); % search .edf files
    for i = 1:length(edfFilesIndex)
        fileIndex = contains(edfFilesIndex(i).name,fileNameSub,'IgnoreCase',true); % search for subject name and time
        if fileIndex
            fileName = edfFilesIndex(i).name;
            break
        end
    end
end

P_right = [];

if ~isempty(fileName)
    subjInfo = load(fullfile(dataPath,strrep(fileName,'.edf','.mat')));
    unique_time = unique(subjInfo.time);
    unique_time(unique_time==0)==[];
    unique_head = unique(subjInfo.head);
    unique_head(unique_head==0)=[];
    
    
    head_times = length(subjInfo.head) ./ length(unique_head);
    
    for j = 1 : length(unique_head)
%         if j == 1 || j == length(unique_head)
%             P_right = cat(2,P_right,sum(trialInfo.choice(trialInfo.head == unique_head(j))) ./ head_times_PC);
%         else
            P_right = cat(2,P_right,sum(subjInfo.choice(subjInfo.head == unique_head(j))-1) ./ head_times);
%         end
    end
    fit_data = [unique_head',P_right',head_times * ones(length(unique_head),1)];

%     [Bias,Threshold] = cum_gaussfit_max1(fit_data(2:end-1,:));
    [Bias,Threshold] = cum_gaussfit_max1(fit_data(1:end,:));
    xi = min(unique_head):0.1:max(unique_head);
    y_fit = cum_gaussfit([Bias,Threshold],xi);
    
    plot([0,0],[0,1],'-.k');
    hold on
    plot(unique_head,P_right,'*');
    plot(xi,y_fit,'-');
    set(gca, 'xlim',[-10,10])
    xlabel('Heading degree');
    ylabel('Proportion of "right" choice');
%     hleg1=legend('choice','mean & standard error','linear result');
%     set(hleg1,'Location','EastOutside')
    text(-9,0.8,sprintf('\\it\\mu_{psy} = \\rm%6.3g\\circ',Bias),'color','b')
    text(-9,0.7,sprintf('\\it\\sigma_{psy} = \\rm%6.3g\\circ', Threshold),'color','b')
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



function dataPath_Callback(hObject, eventdata, handles)
% hObject    handle to dataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dataPath as text
%        str2double(get(hObject,'String')) returns contents of dataPath as a double


% --- Executes during object creation, after setting all properties.
function dataPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in subjectName.
function subjectName_Callback(hObject, eventdata, handles)
% hObject    handle to subjectName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns subjectName contents as cell array
%        contents{get(hObject,'Value')} returns selected item from subjectName
subjectName = cellstr(get(handles.subjectName,'String'));
subjectNameI = get(handles.subjectName,'Value');
dataPath = get(handles.dataPath,'String');
subjectTime = {};
edfFiles = {};
if ~isempty(dataPath)
    edfFilesIndex = dir(fullfile(dataPath,'*.edf')); % search .edf files
    subjectIndex = zeros(1,length(edfFilesIndex));
    for i = 1:length(edfFilesIndex)
        subjectIndex(i) = contains(edfFilesIndex(i).name,subjectName(subjectNameI),'IgnoreCase',true); % search for subject
    end
    for i = 1:length(subjectIndex)
        if subjectIndex(i)
            edfFiles = cat(1,edfFiles,edfFilesIndex(i).name); % filter the file names from subject
        end
    end
    for i = 1:length(edfFiles)
        subjecTimeIs = regexp(edfFiles{i},'\d*');
        subjectTimeIe = regexp(edfFiles{i},'.edf')-1;
        subjectTimeI = edfFiles{i}(subjecTimeIs:subjectTimeIe);
        subjectTime = cat(1,subjectTime,subjectTimeI); % search for times
    end
end
if ~isempty(subjectTime)
    set(handles.subjectTime,'Value',1); % reset the value
    set(handles.subjectTime,'string',subjectTime); % output the times
end


% --- Executes during object creation, after setting all properties.
function subjectName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subjectName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in subjectTime.
function subjectTime_Callback(hObject, eventdata, handles)
% hObject    handle to subjectTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns subjectTime contents as cell array
%        contents{get(hObject,'Value')} returns selected item from subjectTime


% --- Executes during object creation, after setting all properties.
function subjectTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subjectTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in readData.
function readData_Callback(hObject, eventdata, handles)
% hObject    handle to readData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dataPath = get(handles.dataPath,'String');
subjectName = {};
if ~isempty(dataPath)
    if contains(dataPath,'.edf')
        edfFiles = dir(dataPath);
    else
        edfFiles = dir(fullfile(dataPath,'*.edf')); % search edf files
    end
    
    for i = 1:length(edfFiles)
        subjectNameIs = regexp(edfFiles(i).name,'3DEI_')+5;
        subjectNameIe = regexp(edfFiles(i).name,'\d*')-1;
        subjectNameI = edfFiles(i).name(subjectNameIs:subjectNameIe);
        subjectName = cat(1,subjectName,subjectNameI); % filtering subjects name
    end
end
if ~isempty(subjectName)
    subjectName = unique(subjectName);
    set(handles.subjectName,'string',subjectName); % output the names
end
if length(subjectName) == 1
    subjectName_Callback(hObject, eventdata, handles);
end


% --- Executes during object creation, after setting all properties.
function axesSubject_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axesSubject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axesSubject
