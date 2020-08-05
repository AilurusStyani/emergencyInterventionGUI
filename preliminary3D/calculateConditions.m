function calculateConditions()
% car initial degree; side; degree
global TRIALINFO

sd = [sort(repmat(TRIALINFO.initialSide',length(TRIALINFO.degree),1)), repmat(TRIALINFO.degree',length(TRIALINFO.initialSide),1)];
CDsd = [sort(repmat(TRIALINFO.carInitialDeg',size(sd,1),1)), repmat(sd,length(TRIALINFO.carInitialDeg),1)];

TRIALINFO.conditions = CDsd;