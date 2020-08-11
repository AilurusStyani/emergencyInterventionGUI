function escFlag = fixationCheck(fixationPoint,eyeTrackerWinP,fixationPeriod,escape,skipKey,cKey,el)
% fixationPoint: screen position of fixation point
% eyeTrackerWinP: fixation window in pixel
% fixationPeriod: the time window of period
% eye_used: should be in monocular, this function is coded for left eye currently
% escape: the key to break the block
% skipKey: the key to skip the fixation
% cKey: the key to force calibration
% el: eyelink stract
escFlag = 0;
while 1
    fixationStart = tic;
    while 1
        [~,~,keyCode] = KbCheck;
        if keyCode(escape)
            escFlag = 1;
            return
        elseif keyCode(skipKey)
            return
        end
        
        if keyCode(cKey) % press C to calibrate
            EyelinkDoTrackerSetup(el);
            % do a final check of calibration using driftcorrection
            EyelinkDoDriftCorrection(el);
                
            Eyelink('StartRecording');
            Eyelink('message', 'SYNCTIME');	 	 % zero-plot time for EDFVIEW
            error=Eyelink('checkrecording'); 		% Check recording status */
            if(error~=0)
                fprintf('Eyelink checked wrong status.\n');
                cleanup;  % cleanup function
                Eyelink('ShutDown');
                Screen('CloseAll');
            end
            WaitSecs(1); % wait a bit
            break
        end
        
%         if Eyelink( 'NewFloatSampleAvailable')>0
            % get the sample in the form of an event structure
            evt = Eyelink( 'NewestFloatSample');
            eyeUsed = Eyelink('EyeAvailable'); % get eye that's tracked
            if eyeUsed ~= -1 % do we know which eye to use yet?
                px =evt.gx(eyeUsed+1); % +1 as we're accessing MATLAB array
                py = evt.gy(eyeUsed+1);
                % frameStartTime(i) = evt.time;
            end
%         end
        
        if abs((fixationPoint(1)-px)+(fixationPoint(2)-py)*1i) > eyeTrackerWinP
            break
        elseif toc(fixationStart) >= fixationPeriod
            return
        end
    end
end
end