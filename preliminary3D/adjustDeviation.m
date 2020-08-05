function adjustDeviation(increKey,decreKey,deviationAdjust)
global TRIALINFO
[ keyDown, ~, keyCode] = KbCheck;
if ~keyDown
    return;
else
    if keyCode(increKey)
        TRIALINFO.deviation = TRIALINFO.deviation + deviationAdjust;
        disp(['binocular deviation: ' num2str(TRIALINFO.deviation)]);
        calculateFrustum;
    elseif keyCode(decreKey)
        if TRIALINFO.deviation-deviationAdjust>0
            TRIALINFO.deviation = TRIALINFO.deviation - deviationAdjust;
        else
            TRIALINFO.deviation = 0;
        end
        disp(['binocular deviation: ' num2str(TRIALINFO.deviation)]);
        calculateFrustum;
    end
end