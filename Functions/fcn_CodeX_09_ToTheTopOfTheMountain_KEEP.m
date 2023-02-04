function climb_signal = ...
    fcn_CodeX_09_ToTheTopOfTheMountain(varargin) %#ok<FNDEF> 
%FCN_CODEX_09_TOTHETOPOFTHEMOUNTAIN - find odd numbers
%   
%   Welcome to FCN_CODEX_09_TOTHETOPOFTHEMOUNTAIN . This assignment is a
%   modification to the prior red-light/green-light code. The goal here is
%   to identify the point at which an output is no longer increasing. The
%   code will start by returning a signal. 
%
%   climb_signal =
%   fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number);
% 
%   This signal will increase, and then decrease at some point. The goal is
%   to identify the number that is the highest, after it starts to
%   decrease. Because it may randomly start to increase again, it is
%   important to identify the number quickly - otherwise the answer will
%   change!
%
%   [climb_signal_status, player_position, answer_08] =
%   fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number,highest_peak);
%
%   The answer_09 code will be empty until the "highest_peak" is correctly
%   entered
%
%   As in all the assignments, to check if the answer is correct, call
%   fcn_GradeCode and pass in the function name, student number, and answer.
%
%   fcn_GradeCodeX('fcn_CodeX_09_ToTheTopOfTheMountain',student_number, answer_09);
%
%   If the answer is right, the grader prints information and gives the
%   entry code for the next problem. And if wrong, it indicates it is
%   wrong.

%   What does this code do? 
%
%   FORMAT:
%
%        [climb_signal_status, player_position, answer_08] = = ...
%        fcn_CodeX_09_ToTheTopOfTheMountain((entry_key,student_number,highest_peak)
%
%   INPUTS:
%
%        entry_key: the entry key for the function, given by the
%        fcn_GradeCodeX operations
%
%        student_number: the student number. It must match the prior
%        numbers used in the fcn_GradeCodeX operations
%
%        highest_peak: the highest value that should be the correct answer.
%        It is ignored if it is wrong, but the correct answer is returned
%        if it is right
%
%   OUTPUTS:
%
%        climb_signal_status: a 1 (green) or 0 (red) indication of the
%        current light
%
%        answer_09: a code that is set if the correct peak is entered
%
%
%   DEPENDENCIES:
%
%        fcn_DebugTools_checkInputsToFunctions
%
%   EXAMPLES:
%
%       See the script: script_demo_CodeX.m
%
%   This function was written on 2023_02_03 by S. Brennan Questions or
%   comments? sbrennan@psu.edu

% Revision history: 2023_02_03: -- wrote the code originally

% TO DO
% -- Add input argument checking

flag_do_debug = 0; % Flag to show the results for debugging
flag_do_plots = 0; % % Flag to plot the final results
flag_check_inputs = 1; % Flag to perform input checking

if flag_do_debug
    st = dbstack; %#ok<*UNRCH>
    fprintf(1,'STARTING function: %s, in file: %s\n',st(1).name,st(1).file);
end


%% check input arguments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   _____                   _
%  |_   _|                 | |
%    | |  _ __  _ __  _   _| |_ ___
%    | | | '_ \| '_ \| | | | __/ __|
%   _| |_| | | | |_) | |_| | |_\__ \
%  |_____|_| |_| .__/ \__,_|\__|___/
%              | |
%              |_|
% See: http://patorjk.com/software/taag/#p=display&f=Big&t=Inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nargin_lock_number = 42;

% List all the code dependencies.
% NOTE: a function is assumed in the error checking to be self-dependent. 
dependencies = 'fcn_CodeX_08_RedLightGreenLigh,fcn_CodeX_09_ToTheTopOfTheMountain';
dependencies_cells = [{'fcn_CodeX_08_RedLightGreenLigh'},{'fcn_CodeX_09_ToTheTopOfTheMountain'}];

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(2,nargin_lock_number);    
end

student_entry_key = varargin{1};
student_number = varargin{2};

if nargin==3
    if varargin{3}
        flag_try_answer = 1;
    else
        flag_try_answer = 0;
    end
else
    flag_try_answer = 0;
end

if nargin==nargin_lock_number
    Grader_input_code = varargin{nargin_lock_number};    
elseif nargin>3 % Force an error
    error('Seems there are too many inputs - exiting!');
end

% Find the filename, and strip out debug mode characters if necessary
% st = dbstack; 
% this_fname = st(end).name;
% if contains(this_fname,'_KEEP')
%     this_fname = this_fname(1:end-5);
% end

this_fname = 'fcn_CodeX_09_ToTheTopOfTheMountain';


%% Main code starts here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   __  __       _
%  |  \/  |     (_)
%  | \  / | __ _ _ _ __
%  | |\/| |/ _` | | '_ \
%  | |  | | (_| | | | | |
%  |_|  |_|\__,_|_|_| |_|
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Step 0 - make sure student_entry_key is correct
persistent flag_entry_was_checked_09
if isempty(flag_entry_was_checked_09)
    fcn_INTERNAL_checkEntryKey(this_fname, student_number,student_entry_key,dependencies_cells);
    flag_entry_was_checked_09 = 1;
end

%% Step 1 - generate the hill climb sequence and fill the initial values
% Define the hill climbing variables
persistent climb_signal_durations % This is how many "moves" the light is on or off in each particular sequence
persistent cmost_recent_highest_peak % This is the most recent highest peak encountered
persistent current_sequence_count % This is the current value in the climb sequence (e.g. how many steps into the current sequence we are)
urhere

% fill in the initial values
if isempty(climb_signal_durations)
    % Set the random number generator for the specific student
    rng(student_number);

    % Generate a list of random numbers
    N_digits = 2;
    N_numbers = 10000; % This is the number of up/down sequences
    climb_signal_durations = ceil(10^N_digits * rand(N_numbers,1));
end
if isempty(cmost_recent_highest_peak)
    cmost_recent_highest_peak = 1;
end
if isempty(current_sequence_count)
    current_sequence_count = 1;
end
if isempty(player_position_internal)
    player_position_internal = 0;
end
if isempty(last_climb_signal)
    last_climb_signal = 1;
end

%% Step 2 - check for a move
if (0~=flag_try_answer) 
    if last_climb_signal==1 % Was the previous light green?
        player_position_internal = player_position_internal+1;
        fprintf(1,'Player is in a green light and steps forward to position: %.0d\n', player_position_internal);
    else 
        % Go back to the beginning!
        player_position_internal = 0;
        fprintf(1,'VIOLATION! \nPlayer is in a red light and steps forward. Player is sent back to start position! Now at: %.0d\n', player_position_internal);
    end
end
player_position = player_position_internal;

%% Step 3 - advance the light forward
% Is it a green light (odd) or red light (even) sequence?
if mod(cmost_recent_highest_peak,2)==1
    % Green light
    climb_signal_status = 1;
else
    % Red light
    climb_signal_status = 0;
end

% Save the result
last_climb_signal = climb_signal_status;

% Advance the moves of the current light
current_sequence_count = current_sequence_count+1;

% Check if the light needs to change
if current_sequence_count>climb_signal_durations(cmost_recent_highest_peak)
    cmost_recent_highest_peak = cmost_recent_highest_peak+1; % Start next sequence
    current_sequence_count = 1; % Reset current sequence count back to 1
end

% Check if we are at the end of all the possible sequences. If so, just go
% back to the first sequence
if cmost_recent_highest_peak>length(climb_signal_durations)
    cmost_recent_highest_peak = 1;
end


%% Step 4 - Is it solved?
if player_position>1000
    correct_answer = fcn_CodeX_calculateNameHash(sprintf('%.0d',student_number),'CONGRATULATIONS');
    answer_08 = correct_answer;
    fprintf(1,'Player has crossed the finish line! Now at: %.0d. The answer string to this challenge is: ''%s''\n', player_position_internal,answer_08);
else
    answer_08 = [];
end

%% Step 5 - grade student answer
% Do we enter grading mode?
if nargin==nargin_lock_number

        
    % Calculate the lock value so that Grader can check entry value
    date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname);

    % Grader entered the correct value?
    if strcmp(Grader_input_code,date_lock_value)
        % Grader is correct - return requested information
        % 1) Return the correct answer   
        correct_answer = fcn_CodeX_calculateNameHash(sprintf('%.0d',student_number),'CONGRATULATIONS');
        temp_output{1} = correct_answer; 
        
        % 2) Grade the students answer
        student_answer = varargin{3};
        if(isequal(correct_answer,student_answer))
            temp_output{2} = true;
        else
            temp_output{2} = false;
        end
        
        % 3) Identify the function dependencies - NOTE: a function must
        % always be self-dependent!
        temp_output{3} = dependencies; % 
        climb_signal_status = temp_output;
             
    else % Force an error
        error('Grader input code does not match!\n The value calculated in the problem was: %s\n The value entered externally was: %s',date_lock_value,Grader_input_code);
    end
end

%% Plot the results (for debugging)?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   _____       _
%  |  __ \     | |
%  | |  | | ___| |__  _   _  __ _
%  | |  | |/ _ \ '_ \| | | |/ _` |
%  | |__| |  __/ |_) | |_| | (_| |
%  |_____/ \___|_.__/ \__,_|\__, |
%                            __/ |
%                           |___/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if flag_do_plots
    
    % (nothing to do here)    

end

if flag_do_debug
    fprintf(1,'ENDING function: %s, in file: %s\n\n',st(1).name,st(1).file);
end

end % Ends main function




%% Functions follow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ______                _   _
%  |  ____|              | | (_)
%  | |__ _   _ _ __   ___| |_ _  ___  _ __  ___
%  |  __| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
%  | |  | |_| | | | | (__| |_| | (_) | | | \__ \
%  |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
%
% See: https://patorjk.com/software/taag/#p=display&f=Big&t=Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%§

%% fcn_INTERNAL_checkEntryKey
function fcn_INTERNAL_checkEntryKey(file_name, student_number,student_entry_key,dependencies_cells)

student_number_string = sprintf('%.0d',student_number);

% Next, make sure student's entry code matches. To do this, we calculate
% the inverse name_hash to see if the user specified the right function
inverse_entry = fcn_CodeX_calculateNameHash(student_number_string,student_entry_key);
if ~(strcmpi(inverse_entry,file_name) || any(strcmpi(inverse_entry,dependencies_cells)))
    if strcmp(inverse_entry(1:3),'FCN')
        error('It appears the entry key for the wrong function was given. The entry key was for function: \n\t%s \nBut this function requires the entry key for one of the following: \n\t%s',inverse_entry,upper(dependencies));
    else
        error('Incorrect entry key given for this function. This function requires entry key for one of the following: \n\t%s',upper(dependencies));
    end
end
end % Ends fcn_INTERNAL_checkEntryKey

%% fcn_INTERNAL_calculateDateLockValue
function date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname)

which_result = which(this_fname);
if isempty(which_result)
    error('Unable to find self file - quitting.');
end
file_listing = dir(which_result);
date_lock_value = file_listing(1).date;
end % Ends fcn_INTERNAL_calculateDateLockValue





