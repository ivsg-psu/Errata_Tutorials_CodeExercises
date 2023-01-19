function [password] = task9(timerValue)
% This function tests knowledge of timing in MATLAB, requiring a timer
% value as an input
id = 102098;
rng(id*50);

try
    elapsed_time = toc(timerValue);
catch ME
    warning('Use the tic function to start a timer');
    elapsed_time = 0;
end

if elapsed_time < 1
    password = 'too fast';
elseif elapsed_time > 2
    password = 'too slow';
else
    password = floor(100000*rand());
end
end

