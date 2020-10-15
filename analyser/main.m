function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 15-Oct-2020 12:30:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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

% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

axes(handles.axesSubject);
plot([0 0],[-0 0],'-k','LineWidth',3);
xlim([-6 6]);
ylim([-5 7]);
[xa,ya] = ds2nfu([0 0],[-5 0]);
annotation('arrow',xa,ya);
axis off
% quiver(0,-5,0,5,'-k','LineWidth',3);
% hold on

% x = [-3 -3 -3 -3];
% y = [4 4 4 4];
% u = [3 4 5 4];
% v = [-4 -3 0 3];
% quiver(x,y,u,v,'-.','color',[0.1 0.1 0.65 0.5],'LineWidth',2);
% 
% x = [3 3 3 3];
% y = [4 4 4 4];
% u = [-3 -4 -5 -4];
% v = [-4 -3 0 3];
% quiver(x,y,u,v,'-.','color',[0.65 0.1 0.1 0.5],'LineWidth',2);
% hold off

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using main.
% if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
% end

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
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
global dataPath
global fileName
% axes(handles.axesSubject);
% cla;
% delete(findall(gcf,'type','annotation'));
clear subjInfo
dataPath = get(handles.dataPath,'String');

subjectName = get(handles.subjectName,'String');
subjectI = get(handles.subjectName,'Value');
subjectTime = get(handles.subjectTime,'String');
timeI = get(handles.subjectTime,'Value');
fileNameSub = string(strjoin([subjectName(subjectI),'_',subjectTime(timeI)]));
fileNameSub = strrep(fileNameSub,' ','');

if ~isempty(dataPath) && ~isempty(fileNameSub)
    matFilesIndex = dir(fullfile(dataPath,'*.mat')); % search .mat files
    for i = 1:length(matFilesIndex)
        if contains(matFilesIndex(i).name,'Converted_') % ignore eyelink data
            continue
        end
        fileIndex = contains(matFilesIndex(i).name,fileNameSub,'IgnoreCase',true); % search for subject name and time
        if fileIndex
            fileName = matFilesIndex(i).name;
            break
        end
    end
end

if exist('fileName','Var') && ~isempty(fileName)
    filePath = fullfile(dataPath,fileName);
    convertor;
%     subjInfo = load(fullfile(dataPath,fileName));
%     time = unique(subjInfo.TRIALINFO.time);
%     degree = unique(subjInfo.TRIALINFO.degree);
%     headV = subjInfo.TRIALINFO.headingVelocity;
%     carV = subjInfo.TRIALINFO.carVelocity;
%     initialSide = subjInfo.TRIALINFO.initialSide;
%     carInitialDeg = subjInfo.TRIALINFO.carInitialDeg;
    
    %%
%     minY = -headV.*time;
%     maxY = max(cosd(2*carInitialDeg)*-minY,max(sind(-degree)).*carV.*time+cosd(2*carInitialDeg)*-minY);
%     limX = max(-minY*sind(2*carInitialDeg),max(abs(-minY*sind(2*carInitialDeg)-cosd(degree).*carV.*time)));
%     limY = (maxY-minY)/2;
%     plot(0,0)
%     axis equal
%     if limX >= limY
%         maxY = maxY./limY.*limX;
%         minY = minY./limY.*limX;
%     else
%         limX = limY;
%     end
%     xlim([-limX,limX]);
%     ylim([minY,maxY]);
%     [headX,headY] = ds2nfu([0 0],[-headV.*time 0]);
%     annotation('arrow',headX,headY);
%     
%     figure(1)
%     plot([0,0],[0,1],'-.k');
%     hold on
%     plot(unique_head,P_right,'*');
%     plot(xi,y_fit,'-');
%     set(gca, 'xlim',[-10,10])
%     xlabel('Heading degree');
%     ylabel('Proportion of "right" choice');
%     hleg1=legend('choice','mean & standard error','linear result');
%     set(hleg1,'Location','EastOutside')
%     text(-9,0.8,sprintf('\\it\\mu_{psy} = \\rm%6.3g\\circ',Bias),'color','b')
%     text(-9,0.7,sprintf('\\it\\sigma_{psy} = \\rm%6.3g\\circ', Threshold),'color','b')
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
matFiles = {};
if ~isempty(dataPath)
    matFilesIndex = dir(fullfile(dataPath,'*.mat')); % search .mat files
    subjectIndex = zeros(1,length(matFilesIndex));
    for i = 1:length(matFilesIndex)
        if contains(matFilesIndex(i).name,'Converted_')
            continue
        end
        subjectIndex(i) = contains(matFilesIndex(i).name,subjectName(subjectNameI),'IgnoreCase',true); % search for subject
    end
    for i = 1:length(subjectIndex)
        if subjectIndex(i)
            matFiles = cat(1,matFiles,matFilesIndex(i).name); % filter the file names from subject
        end
    end
    for i = 1:length(matFiles)
        subjecTimeIs = regexp(matFiles{i},'\d*');
        subjectTimeIe = regexp(matFiles{i},'.mat')-1;
        subjectTimeI = matFiles{i}(subjecTimeIs(end):subjectTimeIe);
        subjectTime = cat(1,subjectTime,subjectTimeI); % search for times
    end
end
if ~isempty(subjectTime)
    set(handles.subjectTime,'Value',1); % reset the value
    set(handles.subjectTime,'string',subjectTime); % output the times
    if length(subjectTime)==1
        subjectTime_Callback(hObject, eventdata, handles)
    end
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
axes(handles.axesSubject);
cla;
delete(findall(gcf,'type','annotation'));
clear subjInfo
dataPath = get(handles.dataPath,'String');

subjectName = get(handles.subjectName,'String');
subjectI = get(handles.subjectName,'Value');
subjectTime = get(handles.subjectTime,'String');
timeI = get(handles.subjectTime,'Value');
fileNameSub = string(strjoin([subjectName(subjectI),'_',subjectTime(timeI)]));
fileNameSub = strrep(fileNameSub,' ','');

if ~isempty(dataPath) && ~isempty(fileNameSub)
    matFilesIndex = dir(fullfile(dataPath,'*.mat')); % search .mat files
    for i = 1:length(matFilesIndex)
        if contains(matFilesIndex(i).name,'Converted_') % ignore eyelink data
            continue
        end
        fileIndex = contains(matFilesIndex(i).name,fileNameSub,'IgnoreCase',true); % search for subject name and time
        if fileIndex
            fileName = matFilesIndex(i).name;
            break
        end
    end
end

if exist('fileName','Var') && ~isempty(fileName)
    subjInfo = load(fullfile(dataPath,fileName));
    time = unique(subjInfo.TRIALINFO.time);
    degree = unique(subjInfo.TRIALINFO.degree);
    headV = subjInfo.TRIALINFO.headingVelocity;
    carV = subjInfo.TRIALINFO.carVelocity;
    initialSide = subjInfo.TRIALINFO.initialSide;
    carInitialDeg = subjInfo.TRIALINFO.carInitialDeg;
    Conditions = subjInfo.Conditions;
    result = subjInfo.result;
    
    %%
    minY = -headV.*time;
    maxY = max(cosd(2*carInitialDeg)*-minY,max(sind(-degree)).*carV.*time+cosd(2*carInitialDeg)*-minY);
    limX = max(-minY*sind(2*carInitialDeg),max(abs(-minY*sind(2*carInitialDeg)-cosd(degree).*carV.*time)));
    limY = (maxY-minY)/2;
    plot(0,0)
    hold on
    axis equal
    if limX >= limY
        maxY = maxY./limY.*limX;
        minY = minY./limY.*limX;
    else
        limX = limY;
    end
    xlim([-limX,limX]);
    ylim([minY,maxY]);
    [headX,headY] = ds2nfu([0 0],[-headV.*time 0]);
    annotation('arrow',headX,headY,'Color',[0 0 0],'LineWidth',3);
    
    carIniP = headV*time.*[sind(2*carInitialDeg),cosd(2*carInitialDeg)];
    
    for j = 1:length(initialSide)
        for i = 1:length(degree)
            carSPX = carIniP(1)-cosd(degree(i)).*time.*carV;
            carSPY = carIniP(2)-sind(degree(i)).*time.*carV;
            [carX,carY] = ds2nfu([carIniP(1)*initialSide(j),carSPX*initialSide(j)],[carIniP(2),carSPY]);
            h=annotation('arrow',carX,carY,'color',[0.5+0.3*initialSide(j),0.2,0.5-0.3*initialSide(j)]);
            h.LineWidth=2;
            h.LineStyle = ':';
            
            degTrial = and(Conditions(:,2)==initialSide(j), Conditions(:,3)==degree(i));
            breakP = sum(result(degTrial,2) == 2) / sum(degTrial);
            carSPX = carIniP(1)-cosd(degree(i)).*time.*carV*breakP;
            carSPY = carIniP(2)-sind(degree(i)).*time.*carV*breakP;
            [carX,carY] = ds2nfu([carIniP(1)*initialSide(j),carSPX*initialSide(j)],[carIniP(2),carSPY]);
            h1=annotation('line',carX,carY,'color',[0.5+0.3*initialSide(j),0.2,0.5-0.3*initialSide(j)]);
            h1.LineWidth=2;
            h1.LineStyle = '-';
        end
    end
    axis off
end

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
    if contains(dataPath,'.mat')
        matFiles = dir(dataPath);
    else
        matFiles = dir(fullfile(dataPath,'*.mat')); % search edf files
    end
    
    for i = 1:length(matFiles)
        if ~contains(matFiles(i).name,'3DEI')
            continue
        elseif contains(matFiles(i).name,'Converted_')
            continue
        end
        subjectNameIs = regexp(matFiles(i).name,'3DEI_')+5;
        subjectNameIe = regexp(matFiles(i).name,'\d*')-2;
        subjectNameI = matFiles(i).name(subjectNameIs:subjectNameIe(end));
        if ~isempty(subjectNameI)
            subjectName = cat(1,subjectName,subjectNameI); % filtering subjects name
        end
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
