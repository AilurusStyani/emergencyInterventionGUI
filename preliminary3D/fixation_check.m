function fixation_check(fixP,checkWin_pixel,fixT,eye_used,escape,win,fixationPosition,cKey,refreshRate,el)

global STARDATA
global STARFIELD
while 1
    for framej = 1:1000
        fixationStart = tic;
        for framei=1:1000
            [ ~, ~, keyCode ] = KbCheck;
            if keyCode(escape)
                return;
            end
            if keyCode(cKey) % press c to calibrate
                EyelinkDoTrackerSetup(el);
                Eyelink('StartRecording');
                eye_used = Eyelink('EyeAvailable'); % get eye that's tracked
                if eye_used == el.BINOCULAR % if both eyes are tracked
                    eye_used = el.LEFT_EYE; % use left eye
                end
                Eyelink('message', 'SYNCTIME');	 	 % zero-plot time for EDFVIEW
                error=Eyelink('checkrecording'); 		% Check recording status */
                if(error~=0)
                    fprintf('Eyelink checked wrong status.\n');
                    cleanup;  % cleanup function
                    Eyelink('ShutDown');
                    Screen('CloseAll');
                end
                break
            end
            
            % refresh the noise background every several frames
            if mod(framei+framej,STARFIELD.lifeTime)==0
                modifyStarField();
            end
            
            Screen('FillOval', win, [255 255 255 255], fixationPosition);
            DrawDots3D(win,[STARDATA.x ; STARDATA.y; STARDATA.z]);
            glColor3f(0,1,0);
            Screen('Flip', win, 0, 0);
                
            if Eyelink( 'NewFloatSampleAvailable')>0
                % get the sample in the form of an event structure
                evt = Eyelink( 'NewestFloatSample');
                if eye_used ~= -1 % do we know which eye to use yet?
                    px =evt.gx(eye_used+1); % +1 as we're accessing MATLAB array
                    py = evt.gy(eye_used+1);
    %                 frameStartTime(i) = evt.time;
                end
            end
            if px < fixP(1)-checkWin_pixel || px > fixP(1)+checkWin_pixel || py < fixP(2) - checkWin_pixel || py > fixP(2) + checkWin_pixel
                break
            elseif toc(fixationStart) >= fixT
                return
            end  
        end
    end
end