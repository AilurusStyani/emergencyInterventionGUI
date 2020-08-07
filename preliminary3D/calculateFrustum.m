function calculateFrustum(deltaDegree)
global TRIALINFO;
global FRUSTUM;
global SCREEN;

FRUSTUM.clipNear = 1; % cm
FRUSTUM.clipFar = max((cosd(TRIALINFO.carInitialDeg*2)+1).*TRIALINFO.time.*TRIALINFO.headingVelocity,...
    (cosd(TRIALINFO.carInitialDeg*2)+1).*TRIALINFO.time.*TRIALINFO.headingVelocity+max(1-sind(TRIALINFO.degree)).*TRIALINFO.time.*TRIALINFO.carVelocity); % cm

FRUSTUM.top = (FRUSTUM.clipNear / SCREEN.distance) * (SCREEN.heightCM / 2.0);
FRUSTUM.bottom = (FRUSTUM.clipNear / SCREEN.distance) * (-SCREEN.heightCM / 2.0);

if nargin == 0
    % left eye
    FRUSTUM.sinisterRight = (FRUSTUM.clipNear / SCREEN.distance) * (SCREEN.widthCM / 2.0 + TRIALINFO.deviation / 2.0);
    FRUSTUM.sinisterLeft = (FRUSTUM.clipNear / SCREEN.distance) * (-SCREEN.widthCM / 2.0 + TRIALINFO.deviation / 2.0);
    
    % right eye
    FRUSTUM.dexterRight = (FRUSTUM.clipNear / SCREEN.distance) * (SCREEN.widthCM / 2.0 - TRIALINFO.deviation / 2.0);
    FRUSTUM.dexterLeft = (FRUSTUM.clipNear / SCREEN.distance) * (-SCREEN.widthCM / 2.0 - TRIALINFO.deviation / 2.0);
    
elseif nargin == 1
    delta = FRUSTUM.clipNear * sind(deltaDegree);
    % left eye
    FRUSTUM.sinisterRight = (FRUSTUM.clipNear / SCREEN.distance) * (SCREEN.widthCM / 2.0 + TRIALINFO.deviation / 2.0)+delta;
    FRUSTUM.sinisterLeft = (FRUSTUM.clipNear / SCREEN.distance) * (-SCREEN.widthCM / 2.0 + TRIALINFO.deviation / 2.0)+delta;
    
    % right eye
    FRUSTUM.dexterRight = (FRUSTUM.clipNear / SCREEN.distance) * (SCREEN.widthCM / 2.0 - TRIALINFO.deviation / 2.0)+delta;
    FRUSTUM.dexterLeft = (FRUSTUM.clipNear / SCREEN.distance) * (-SCREEN.widthCM / 2.0 - TRIALINFO.deviation / 2.0)+delta;
end