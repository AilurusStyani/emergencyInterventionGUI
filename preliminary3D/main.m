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
%      unrecognized property subjectName or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 31-Jul-2020 10:43:59

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

loadParameters_Callback(hObject, eventdata, handles);

% Update handles structure
guidata(hObject, handles);

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



function subjectName_Callback(hObject, eventdata, handles)
% hObject    handle to subjectName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subjectName as text
%        str2double(get(hObject,'String')) returns contents of subjectName as a double


% --- Executes during object creation, after setting all properties.
function subjectName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subjectName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function repeatNum_Callback(hObject, eventdata, handles)
% hObject    handle to repeatNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of repeatNum as text
%        str2double(get(hObject,'String')) returns contents of repeatNum as a double


% --- Executes during object creation, after setting all properties.
function repeatNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to repeatNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function coherence_Callback(hObject, eventdata, handles)
% hObject    handle to coherence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coherence as text
%        str2double(get(hObject,'String')) returns contents of coherence as a double


% --- Executes during object creation, after setting all properties.
function coherence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coherence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carVelocity_Callback(hObject, eventdata, handles)
% hObject    handle to carVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carVelocity as text
%        str2double(get(hObject,'String')) returns contents of carVelocity as a double


% --- Executes during object creation, after setting all properties.
function carVelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function moveTime_Callback(hObject, eventdata, handles)
% hObject    handle to moveTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of moveTime as text
%        str2double(get(hObject,'String')) returns contents of moveTime as a double


% --- Executes during object creation, after setting all properties.
function moveTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moveTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function choicePeriod_Callback(hObject, eventdata, handles)
% hObject    handle to moveTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of moveTime as text
%        str2double(get(hObject,'String')) returns contents of moveTime as a double


% --- Executes during object creation, after setting all properties.
function choicePeriod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moveTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pupilAdaptionTime_Callback(hObject, eventdata, handles)
% hObject    handle to pupilAdaptionTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pupilAdaptionTime as text
%        str2double(get(hObject,'String')) returns contents of pupilAdaptionTime as a double


% --- Executes during object creation, after setting all properties.
function pupilAdaptionTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pupilAdaptionTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function degree_Callback(hObject, eventdata, handles)
% hObject    handle to degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of degree as text
%        str2double(get(hObject,'String')) returns contents of degree as a double


% --- Executes during object creation, after setting all properties.
function degree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fixationThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to fixationThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fixationThreshold as text
%        str2double(get(hObject,'String')) returns contents of fixationThreshold as a double


% --- Executes during object creation, after setting all properties.
function fixationThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixationThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear STARDATA
clear STARFIELD

global TRIALINFO;
global CAMERA;
global STARFIELD;
global STARDATA;
global SCREEN;
global FRUSTUM;

subjectName = get(handles.subjectName,'String');
subjectName = strrep(subjectName,' ',''); % delete blank space
subjectName = strrep(subjectName,'_','');

if isempty(subjectName)
    subjectName = 'test';
end

fileName = ['3DEI_' subjectName '_' datestr(now,'yymmddHHMM')];
curDir = pwd;
TRIALINFO.degree= str2num(get(handles.degree,'String')); % right: positive; left: negative
TRIALINFO.pupilAdaptionTime = str2double(get(handles.pupilAdaptionTime,'String'));
TRIALINFO.lifeTime = str2double(get(handles.lifeTime,'String'));
TRIALINFO.carVelocity = str2num(get(handles.carVelocity,'String'));%% m/s
TRIALINFO.headingVelocity = str2num(get(handles.headingVelocity,'String'));
TRIALINFO.coherence = str2double(get(handles.coherence,'String'));
TRIALINFO.time = str2num(get(handles.moveTime,'String')); % need to notice the FPS
TRIALINFO.deviation = str2double(get(handles.deviation,'String')); % initial binocular deviation, cm
deviationAdjust = 0.05; % how fast to adjust the deviation by key pressing, cm
TRIALINFO.repetition = str2double(get(handles.repeatNum,'String'));%% trial repeat nums
SCREEN.distance = str2double(get(handles.distance,'String'));% cm

TRIALINFO.feedback = get(handles.feedback,'Value');
TRIALINFO.eyelinkRecording = get(handles.eyelinkRecording,'Value');

% car
TRIALINFO.carSize = str2num(get(handles.carSize,'String'));% cm x,y,z size of the car
TRIALINFO.carInitialDeg = str2double(get(handles.carInitialDeg,'String')); % degree to the middle line from camera initial position
TRIALINFO.initialSide = str2num(get(handles.initialSide,'String')); % -1 for left, 1 for right

try 
    test = length(TRIALINFO.carSize);
    if test ~= 3
        error("invalid car size.");
    end
catch
    error("invalid car size.");
end

if TRIALINFO.eyelinkRecording
    % eye-choice version, define the related threshold
    TRIALINFO.fixationWindow = str2double(get(handles.fixationWindow,'String'));%% eyeWindow set + - 2бу
    TRIALINFO.fixationThreshold = str2double(get(handles.fixationThreshold,'String')); %% chosen when fix on 0.2s = 200ms
    
    % break options
    TRIALINFO.trialBreak = get(handles.trialBreak,'Value');
    TRIALINFO.checkWindowDegree = str2double(get(handles.checkWindow,'String'));
    
    % auto-calibration options
    TRIALINFO.calibration = get(handles.calibration,'Value');
    TRIALINFO.calibrationInterval = str2double(get(handles.calibrationInterval,'String')) * 60; % minutes to seconds
    
    % choicing method
    TRIALINFO.handle = get(handles.handle,'Value');
    TRIALINFO.gazePosition = get(handles.gazePosition,'Value');
else
    TRIALINFO.trialBreak = 0;
    TRIALINFO.calibration = 0;
    TRIALINFO.handle = 1;
    TRIALINFO.gazePosition = 0;
end

dataPath = get(handles.dataPath,'String');
if ~isempty(dataPath)
    try
        mkdir(dataPath);
    catch
        dataPath = fullfile(pwd,'data');
        mkdir(dataPath);
    end
else
    dataPath = fullfile(pwd,'data');
    mkdir(dataPath);
end
TRIALINFO.dataPath = dataPath;

% set keyboard
KbName('UnifyKeyNames'); 
skipKey = KbName('space'); % force skip the fixation, for debug only
escape = KbName('f1');
leftKey = KbName('LeftArrow');
rightKey = KbName('RightArrow');
upKey = KbName('UpArrow');
downKey = KbName('DownArrow');
cKey = KbName('c'); % force calibration

pageUp = KbName('pageup'); % increase binocular deviation
pageDown = KbName('pagedown'); % decrease binocular deviation

%% parameters
fixationSizeD = 0.05;  % degree
TRIALINFO.fixationPeriod = 0.5; % second

TRIALINFO.intertrialInterval = 1; % second

% parameters for the star field
STARFIELD.dimensionX = 400;  % cm
STARFIELD.dimensionY = 5;  % cm
STARFIELD.dimensionZ = 3000;  % cm
STARFIELD.starSize = 0.1;    % degree
STARFIELD.density = 1000/100^3;    % convert num/m^3 to num/cm^3

STARFIELD.probability = TRIALINFO.coherence;

timePredicted = (TRIALINFO.fixationPeriod +TRIALINFO.time + TRIALINFO.intertrialInterval)...
    * TRIALINFO.repetition * length(TRIALINFO.degree) * length(TRIALINFO.time);
    
disp(['This block will cost  ' num2str(timePredicted/60) ' minutes.']);
disp('Press any key to terminate the mission or it will start in 2 seconds.')
tic;
while toc<2
    [ keyDown, ~, ~] = KbCheck;
    if keyDown % press any key to terminate the mission
        return;
    end
end


global GL;
if TRIALINFO.eyelinkRecording
    Screen('Preference', 'SkipSyncTests', 0); % for recording
else
    Screen('Preference', 'SkipSyncTests', 1); % for debug/test
end

AssertOpenGL;
InitializeMatlabOpenGL;

screenIndex = (Screen('Screens'));
if length(screenIndex) > 1
    SCREEN.screenId = max(screenIndex)-1;
else
    SCREEN.screenId = max(screenIndex);
end

PsychImaging('PrepareConfiguration');

% Define background color:
whiteBackground = WhiteIndex(SCREEN.screenId);
blackBackground = BlackIndex(SCREEN.screenId);
grayBackground  = GrayIndex(SCREEN.screenId);

% Open a double-buffered full-screen window on the main displays screen.
[win , winRect] = PsychImaging('OpenWindow', SCREEN.screenId);
SCREEN.widthPix = winRect(3);
SCREEN.heightPix = winRect(4);
SCREEN.centre = [SCREEN.widthPix/2, SCREEN.heightPix/2];

[width, height] = Screen('DisplaySize', SCREEN.screenId);
SCREEN.widthCM = width/10; % mm to cm
SCREEN.heightCM = height/10; % mm to cm

SCREEN.refreshRate = Screen('NominalFrameRate', SCREEN.screenId);

TRIALINFO.fixationSize = degree2pix(fixationSizeD);

% parameters for the camera
CAMERA.elevation = 25; % unit cm
CAMERA.distance = SCREEN.distance; % unit cm, distance from participant to the screen
CAMERA.sightDegreeVer = atand(SCREEN.heightCM * 0.5 / CAMERA.distance)*2; % degree of view field on vertical
CAMERA.sightDegreeHor = atand(SCREEN.widthCM * 0.5 / CAMERA.distance)*2; % degree of view field on horizon

%% save parameters as log file
save('log.mat','TRIALINFO','SCREEN');

%% the configuration of the Frustum
calculateFrustum();

Screen('BeginOpenGL', win);
glViewport(0, 0, RectWidth(winRect), RectHeight(winRect));
glColorMask(GL.TRUE, GL.TRUE, GL.TRUE, GL.TRUE);
Screen('EndOpenGL', win);

%% trial conditions and order
calculateConditions();
trialIndex = repmat(TRIALINFO.conditions, TRIALINFO.repetition,1);
trialNum = size(trialIndex,1);
trialOrder = randperm(trialNum);

disp(['This block has  ' num2str(trialNum) ' trials']);

%% initial Eyelink
if TRIALINFO.eyelinkRecording
    tempName = 'TEMP1'; % need temp name because Eyelink only know 
                          % hows to save names with 8 chars or less. 
                          % Will change name using matlab's moveFile later.
    dummymode=0;
    
    el=EyelinkInitDefaults(win);
    el.backgroundcolour = BlackIndex(el.window);
    el.foregroundcolour = GrayIndex(el.window);
    el.msgfontcolour    = WhiteIndex(el.window);
    el.imgtitlecolour   = WhiteIndex(el.window);
    el.calibrationtargetcolour = GrayIndex(el.window);
    
    if ~EyelinkInit(dummymode)
        fprintf('Eyelink Init aborted.\n');
        cleanup;  % cleanup function
        Eyelink('ShutDown');
        Screen('CloseAll');
        return
    end
    
    triali = Eyelink('Openfile', tempName);
    if triali~=0
        fprintf('Cannot create EDF file ''%s'' ', fileName);
        cleanup;
        Eyelink('ShutDown');
        Screen('CloseAll');
        return
    end
    
    %   SET UP TRACKER CONFIGURATION
    Eyelink('command', 'calibration_type = HV9');
    
    %	set parser (conservative saccade thresholds)
    Eyelink('command', 'saccade_velocity_threshold = %d', 35);
    Eyelink('command', 'saccade_acceleration_threshold = %d', 9500);
    Eyelink('command', 'link_sample_data  = LEFT,RIGHT,GAZE,AREA');
    Eyelink('command', 'online_dcorr_refposn = %1d, %1d', SCREEN.centre(1), SCREEN.centre(2));
    Eyelink('command', 'online_dcorr_maxangle = %1d', 30.0);
    
    % you must call this function to apply the changes from above
    EyelinkUpdateDefaults(el);
    
    % Calibrate the eye tracker
    EyelinkDoTrackerSetup(el);
    
    % do a final check of calibration using driftcorrection
    EyelinkDoDriftCorrection(el);
    
    Eyelink('StartRecording');
    
    Eyelink('message', 'SYNCTIME');	 	 % zero-plot time for EDFVIEW
%     eye_used = Eyelink('EyeAvailable'); % get eye that's tracked
%     if eye_used == el.BINOCULAR % if both eyes are tracked
%         eye_used = el.LEFTEYE; % use left eye
%     end
    errorCheck=Eyelink('checkrecording'); 		% Check recording status */
    if(errorCheck~=0)
        fprintf('Eyelink checked wrong status.\n');
        cleanup;  % cleanup function
        Eyelink('ShutDown');
        Screen('CloseAll');
        return
    end
    
    calibrateCkeck = tic;
    % wait a little bit, in case the key press during calibration influence the following keyboard check
    while 1
        [ keyDown, ~, ~] = KbCheck;
        if ~keyDown
            break
        end
    end
end

Screen('FillRect', win ,blackBackground,[0 0 SCREEN.widthPix SCREEN.heightPix]);
Screen('Flip', win,0,0);

HideCursor(SCREEN.screenId);

%% pupil adapting
pupilAdapt = tic;
paI = 0;
tempP = [0, CAMERA.elevation, TRIALINFO.headingVelocity.*TRIALINFO.time];

if TRIALINFO.eyelinkRecording
    Eyelink('message', 'Pupil adapting started');
end

while toc(pupilAdapt) <= TRIALINFO.pupilAdaptionTime
    if mod(paI,TRIALINFO.lifeTime) == 0
        modifyStarFieldBottomHalf();
    end
    adjustDeviation(pageUp,pageDown,deviationAdjust);
    
    drawBinocularScene(win,tempP+[0,0,-TRIALINFO.headingVelocity].*paI./SCREEN.refreshRate);
    drawFixation(SCREEN.centre,TRIALINFO.fixationSize,win);
    
    Screen('Flip', win, 0, 0);
    paI = paI+1;
end

if TRIALINFO.eyelinkRecording
    Eyelink('message', 'Pupil adapting finished');
end

%% trial begin
blockSt = tic;
choiceTime = nan(trialNum,1);
Conditions = nan(trialNum,3);
result = nan(trialNum,2); % clash(true/false) / 0 no choice, 1 speedup, 2 brake
breakFlag = false;
for triali = 1:trialNum
    trialInterval = tic;
    SetMouse(0,0);
    [ ~, ~, keyCode] = KbCheck;
    if keyCode(escape)
        break;
    end
    
    if TRIALINFO.eyelinkRecording
        % auto-calibration
        if TRIALINFO.calibration
            if toc(calibrateCkeck) >= TRIALINFO.calibrationInterval
                EyelinkDoTrackerSetup(el);
                EyelinkDoDriftCorrection(el);
                Eyelink('StartRecording');
                Eyelink('message', 'Calibrate Finished');
                errorCheck=Eyelink('checkrecording'); 		% Check recording status */
                if(errorCheck~=0)
                    fprintf('Eyelink checked wrong status.\n');
                    cleanup;  % cleanup function
                    Eyelink('ShutDown');
                    Screen('CloseAll');
                    return
                end
                calibrateCkeck = tic;
                % check for key release
                while 1
                    [ keyDown, ~, ~] = KbCheck;
                    if ~keyDown
                        break
                    end
                end
            end
        end
    end
    conditioni = trialIndex(trialOrder(triali),:);
    
    [carP, cameraP] = calculateMovement(conditioni,SCREEN.refreshRate);
    
    while 1
        if toc(trialInterval) >= TRIALINFO.intertrialInterval
            break
        else
            WaitSecs(0.05); % inter-trial interval
        end
    end
    
    if TRIALINFO.eyelinkRecording
        Eyelink('message', ['Trial ' num2str(triali) ' start.']);
    end
    frameNum = size(carP,1);
    framei = 0;
    keyPress = 0;
    clash = false;
    speed = 1;
    while true
        adjustDeviation(pageUp,pageDown,deviationAdjust);
        
        [ keyDown, ~, keyCode] = KbCheck;
        if keyDown
            if keyCode(upKey)
                keyPress = 1;
                speed = 3;
                choiceTime(triali) = toc(blockSt);
                if TRIALINFO.eyelinkRecording
                    Eyelink('message', ['Choice made as speedup 1 in trial ' num2str(triali)]);
                end
            end
            if keyCode(downKey)
                keyPress = 2; 
                speed = 3;
                choiceTime(triali) = toc(blockSt);
                if TRIALINFO.eyelinkRecording
                    Eyelink('message', ['Choice made as brake 2 in trial ' num2str(triali)]);
                end
            end
            if keyCode(escape)
                breakFlag = true;
                break
            end
        end
        
        if framei+speed <= frameNum
            framei = framei+speed;
        elseif framei+speed > frameNum
            break
        end
        
        if keyPress ~= 2
            pi = framei;
        end
        
        if mod(framei,TRIALINFO.lifeTime) == 0
            modifyStarFieldBottomHalf();
        end
        
        if inpolygon(cameraP(pi,1),cameraP(pi,3),... % x,z
                [carP(framei,1)-TRIALINFO.carSize(1)*0.5,... % xv
                 carP(framei,1)-TRIALINFO.carSize(1)*0.5,...
                 carP(framei,1)+TRIALINFO.carSize(1)*0.5,...
                 carP(framei,1)+TRIALINFO.carSize(1)*0.5,],...
                [carP(framei,3)+TRIALINFO.carSize(3)*0.5,... % zv
                 carP(framei,3)-TRIALINFO.carSize(3)*0.5,...
                 carP(framei,3)-TRIALINFO.carSize(3)*0.5,...
                 carP(framei,3)+TRIALINFO.carSize(3)*0.5,])
            clash = true;
        end
        
        drawBinocularScene(win,cameraP,pi,framei,carP);        
        drawFixation(SCREEN.centre,TRIALINFO.fixationSize,win);
        
        Screen('Flip', win, 0, 0);
        
        if clash
            if TRIALINFO.eyelinkRecording
                Eyelink('message', ['Car clashed in trial ' num2str(triali)]);
            end
            break
        end
    end
    
    if breakFlag
        break;
    end
    if keyPress == 0
        if TRIALINFO.eyelinkRecording
            Eyelink('message', ['No choice made in trial ' num2str(triali)]);
        end
    end
    %% feedback
    result(triali,:) = [clash,keyPress];
    Conditions(triali,:) = conditioni;
    
    drawBinocularScene(win,cameraP,pi,framei,carP);    
    drawFixation(SCREEN.centre,TRIALINFO.fixationSize,win);
    
    if clash
        [~, ~, ~] = DrawFormattedText(win, 'CLASH!!','center',SCREEN.centre(2)/2,[200 20 20]);
    else
        [~, ~, ~] = DrawFormattedText(win, 'Safe','center',SCREEN.centre(2)/2,[20 200 20]);
    end
    Screen('TextBackgroundColor',win, [0 0 0 0]);
    Screen('DrawingFinished',win);
    Screen('Flip', win, 0, 0);
    if TRIALINFO.eyelinkRecording
        Eyelink('message', ['Feedback given in trial ' num2str(triali)]);
    end
end

Screen('Flip', win);

if TRIALINFO.eyelinkRecording
    Eyelink('StopRecording');
    Eyelink('CloseFile');
    try
        fprintf('Receiving data file ''%s''\n',fileName);
        status=Eyelink('ReceiveFile',tempName ,saveDir,1);
        if status > 0
            fprintf('ReceiveFile status %d\n ', status);
        end
        if exist(fileName, 'file')==2
            fprintf('Data file ''%s'' can be found in '' %s\n',fileName, pwd);
        end
    catch
        fprintf('Problem receiving data file ''%s''\n',fileName);
    end
    
    cd (saveDir);
    save(fullfile(saveDir,fileName));
    movefile([saveDir,'\',tempName,'.edf'],[saveDir,'\',fileName,'.edf']);
    
    % shut down the eyelink
    Eyelink('ShutDown');
end

%% save the real and the choiced heading
Screen('CloseAll');
if ~breakFlag
    save(fullfile(TRIALINFO.dataPath,fileName),'TRIALINFO','Conditions','SCREEN','CAMERA','result','choiceTime');
end
cd(curDir);




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over start.
function start_ButtonDownFcn(hObject, eventdata, handles)


            

% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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

% --- Executes on button press in feedback.
function feedback_Callback(hObject, eventdata, handles)
% hObject    handle to feedback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of feedback



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in trialBreak.
function trialBreak_Callback(hObject, eventdata, handles)
% hObject    handle to trialBreak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of trialBreak



function checkWindow_Callback(hObject, eventdata, handles)
% hObject    handle to checkWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of checkWindow as text
%        str2double(get(hObject,'String')) returns contents of checkWindow as a double


% --- Executes during object creation, after setting all properties.
function checkWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lifeTime_Callback(hObject, eventdata, handles)
% hObject    handle to lifeTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lifeTime as text
%        str2double(get(hObject,'String')) returns contents of lifeTime as a double


% --- Executes during object creation, after setting all properties.
function lifeTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lifeTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calibration.
function calibration_Callback(hObject, eventdata, handles)
% hObject    handle to calibration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of calibration



function calibrationInterval_Callback(hObject, eventdata, handles)
% hObject    handle to calibrationInterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calibrationInterval as text
%        str2double(get(hObject,'String')) returns contents of calibrationInterval as a double


% --- Executes during object creation, after setting all properties.
function calibrationInterval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calibrationInterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when uibuttongroup1 is resized.
function uibuttongroup1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in eyelinkRecording.
function eyelinkRecording_Callback(hObject, eventdata, handles)
% hObject    handle to eyelinkRecording (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of eyelinkRecording



function deviation_Callback(hObject, eventdata, handles)
% hObject    handle to test16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test16 as text
%        str2double(get(hObject,'String')) returns contents of test16 as a double

% --- Executes during object creation, after setting all properties.
function deviation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixationWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function test16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fixationWindow_Callback(hObject, eventdata, handles)
% hObject    handle to fixationWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fixationWindow as text
%        str2double(get(hObject,'String')) returns contents of fixationWindow as a double


% --- Executes during object creation, after setting all properties.
function fixationWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixationWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in handle.
function handle_Callback(hObject, eventdata, handles)
% hObject    handle to handle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of handle



function distance_Callback(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distance as text
%        str2double(get(hObject,'String')) returns contents of distance as a double


% --- Executes during object creation, after setting all properties.
function distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function headingVelocity_Callback(hObject, eventdata, handles)
% hObject    handle to headingVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of headingVelocity as text
%        str2double(get(hObject,'String')) returns contents of headingVelocity as a double


% --- Executes during object creation, after setting all properties.
function headingVelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to headingVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveParameters.
function saveParameters_Callback(hObject, eventdata, handles)
% hObject    handle to saveParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in loadParameters.
function loadParameters_Callback(hObject, eventdata, handles)
% hObject    handle to loadParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
logFile = dir('log.mat');
if ~isempty(logFile)
    try
        load(logFile(1).name);
        if exist('TRIALINFO','VAR')
            set(handles.degree,'String',num2str(TRIALINFO.degree));
            set(handles.moveTime,'String',num2str(TRIALINFO.time));
            set(handles.carVelocity,'String',num2str(TRIALINFO.carVelocity));
            set(handles.headingVelocity,'String',num2str(TRIALINFO.headingVelocity))
            set(handles.repeatNum,'String',num2str(TRIALINFO.repetition));
            set(handles.coherence,'String',num2str(TRIALINFO.coherence));
            set(handles.pupilAdaptionTime,'String',num2str(TRIALINFO.pupilAdaptionTime));
            set(handles.feedback,'Value',TRIALINFO.feedback);
            
            set(handles.lifeTime,'String',num2str(TRIALINFO.lifeTime));
            set(handles.deviation,'String',num2str(TRIALINFO.deviation));
            set(handles.dataPath,'String',num2str(TRIALINFO.dataPath));
            
            set(handles.eyelinkRecording,'Value',TRIALINFO.eyelinkRecording);
            
            set(handles.carSize,'String',num2str(TRIALINFO.carSize));
            set(handles.carInitialDeg,'String',num2str(TRIALINFO.carInitialDeg));
            set(handles.initialSide,'String',num2str(TRIALINFO.initialSide));
            
            if TRIALINFO.eyelinkRecording
                if TRIALINFO.eyelinkRecording
                    set(handles.trialBreak,'Value',TRIALINFO.trialBreak);
                    set(handles.checkWindow,'String',num2str(TRIALINFO.checkWindowDegree));
                    set(handles.calibration,'Value',TRIALINFO.calibration);
                    set(handles.calibrationInterval,'String',num2str(TRIALINFO.calibrationInterval));
                    
                    set(handles.fixationWindow,'String',num2str(TRIALINFO.fixationWindow));
                    set(handles.fixationThreshold,'String',num2str(TRIALINFO.fixationThreshold));
                    
                    set(handles.handle,'Value',TRIALINFO.handle);
                    set(handles.gazePosition,'Value',TRIALINFO.gazePosition);
                end
            end
        end
    catch
        error('Some problems occured when loading parameters.')
    end
end



function carSize_Callback(hObject, eventdata, handles)
% hObject    handle to carSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carSize as text
%        str2double(get(hObject,'String')) returns contents of carSize as a double


% --- Executes during object creation, after setting all properties.
function carSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carInitialDeg_Callback(hObject, eventdata, handles)
% hObject    handle to carInitialDeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carInitialDeg as text
%        str2double(get(hObject,'String')) returns contents of carInitialDeg as a double


% --- Executes during object creation, after setting all properties.
function carInitialDeg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carInitialDeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialSide_Callback(hObject, eventdata, handles)
% hObject    handle to initialSide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialSide as text
%        str2double(get(hObject,'String')) returns contents of initialSide as a double


% --- Executes during object creation, after setting all properties.
function initialSide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialSide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
