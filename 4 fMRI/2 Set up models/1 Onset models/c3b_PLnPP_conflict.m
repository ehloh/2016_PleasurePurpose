function [variables c] = modname(datastruc, colstruc, c) 
% Non-orthogonalized: Each variable has its own onset + pmod, Duplicate onsets are ignored in first-level contrasts
% 
% datastruc: {1} Rating {2} Choice {3} Choice Lab {4} Choice All
%
% Session 1 events: Fixation (0.5-3s)  ->   Event (5s)  ->   
%       ->   Pleasure rating (until response, max 5s)  ->   Jitter (0.5-3s)  ->   
%       ->   Purpose rating (until response, max 5s)
%  -----------------------------------------------------------------------------

%% 

variables = []; 

% Events presented for rating + pmods (competing)
[variables c] = i_mainevents(2.1, datastruc{2}(datastruc{2}(:, colstruc{2}.TrialOK)==1,:),  variables, colstruc{2}, c );  

% Events presented for rating + pmods (competing)
[variables c] = i_choiceevent_Competing(1, datastruc{2}(datastruc{2}(:, colstruc{2}.TrialOK)==1,:), {'PLbincf', 'PPbincf'}, variables, colstruc{2}, c );  

% NO-INTEREST regressors
[variables c] = i_nointerest(2, datastruc{2}, {'Motor'; 'ChoiceMiss'; 'RatingMissingTrial'}, variables, colstruc{2}, c);

   
end

