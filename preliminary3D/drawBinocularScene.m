function drawBinocularScene(win,cameraP,pi,framei,carP)
global TRIALINFO
global FRUSTUM
global GL
global SCREEN
global STARDATA
global CAMERA
if nargin == 1
    cameraP = [0, CAMERA.elevation, 0];
    pi = 1;
    car = false;
elseif nargin == 2
    pi = 1;
    car = false;
elseif nargin == 3
    car = false;
elseif nargin == 5
    car = true;
else
    error('Invalid arguments. Please check.')
end
    
Screen('BeginOpenGL', win);
% left eye
glColorMask(GL.TRUE, GL.FALSE, GL.FALSE, GL.FALSE);
glMatrixMode(GL.PROJECTION);
glLoadIdentity;
glFrustum( FRUSTUM.sinisterLeft,FRUSTUM.sinisterRight, FRUSTUM.bottom, FRUSTUM.top, FRUSTUM.clipNear, FRUSTUM.clipFar);
glMatrixMode(GL.MODELVIEW);
glLoadIdentity;
gluLookAt(cameraP(pi,1)-TRIALINFO.deviation,cameraP(pi,2),cameraP(pi,3),...
    cameraP(pi,1)-TRIALINFO.deviation,cameraP(pi,2),cameraP(pi,3)-SCREEN.distance, ...
    0,1,0)
glClearColor(0,0,0,0);
glColor3f(1.0,1.0,0.0);
if car
    drawCar(carP(framei,:));
end
DrawDots3D(win,[STARDATA.x ; STARDATA.y; STARDATA.z]);

% right eye
glColorMask(GL.FALSE, GL.TRUE, GL.FALSE, GL.FALSE);
glMatrixMode(GL.PROJECTION);
glLoadIdentity;
glFrustum( FRUSTUM.dexterLeft,FRUSTUM.dexterRight, FRUSTUM.bottom, FRUSTUM.top, FRUSTUM.clipNear, FRUSTUM.clipFar);
glMatrixMode(GL.MODELVIEW);
glLoadIdentity;
gluLookAt(cameraP(pi,1)+TRIALINFO.deviation,cameraP(pi,2),cameraP(pi,3),...
    cameraP(pi,1)+TRIALINFO.deviation,cameraP(pi,2),cameraP(pi,3)-SCREEN.distance,...
    0,1,0)
glClearColor(0,0,0,0);
glColor3f(1.0,1.0,0.0);

if car
    drawCar(carP(framei,:));
end
DrawDots3D(win,[STARDATA.x ; STARDATA.y; STARDATA.z]);

Screen('EndOpenGL', win);