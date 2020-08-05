function [carP, cameraP] = calculateMovement(condition,frameRate)
global TRIALINFO
global CAMERA

time = TRIALINFO.time;
iniDeg = condition(1);
side = condition(2);
carDeg = condition(3);
carV = TRIALINFO.carVelocity;
headV = TRIALINFO.headingVelocity;

distance =time*headV;
initialCamera = [0, CAMERA.elevation, distance];
initialCar = [distance*sind(2*iniDeg)*side, 0, -distance*cosd(2*iniDeg)];

frameNum = time*frameRate;
carP = nan(frameNum,3);
cameraP = nan(frameNum,3);
for i =1:frameNum
    carP(i,:) = initialCar + [cosd(carDeg)*-side,0,sind(carDeg)].*carV.*time.*i./frameNum;
    cameraP(i,:) = initialCamera + [0,0,-1].*headV.*time.*i./frameNum;
end
