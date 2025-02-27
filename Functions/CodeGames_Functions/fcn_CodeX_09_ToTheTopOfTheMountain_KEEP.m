function [climb_height, answer_09] = ...
    fcn_CodeX_09_ToTheTopOfTheMountain(varargin) %#ok<FNDEF> 
%FCN_CODEX_09_TOTHETOPOFTHEMOUNTAIN - find the most recent peak of a
%sequence
%   
%   Welcome to FCN_CODEX_09_TOTHETOPOFTHEMOUNTAIN . This assignment is a
%   modification to the prior red-light/green-light code. The goal here is
%   to identify the point at which an output is no longer increasing. The
%   code will start by returning a signal. 
%
%   climb_height =
%   fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number);
% 
%   This signal will increase, and then decrease at some point, and then
%   increase, and then decrease, etc. The goal is to identify the number
%   that is the most immediate highest, after it starts to decrease.
%   Because the "climb" may randomly start to increase again, it is
%   important to identify the number quickly - otherwise the answer will
%   change!
%
%   [climb_height, answer] =
%   fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number,highest_peak);
%
%   The answer variable will be returned as empty until the "highest_peak"
%   is correctly entered
%
%   As in all the assignments, to check if the answer is correct, call
%   fcn_GradeCode and pass in the function name, student number, and answer.
%
%   fcn_GradeCodeX('fcn_CodeX_09_ToTheTopOfTheMountain', answer, student_number);
%
%   If the answer is right, the grader prints information and gives the
%   entry code for the next problem. And if wrong, it indicates it is
%   wrong.

%   What does this code do? 
%
%   FORMAT:
%
%        [climb_height, answer_09] = ...
%        fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number,highest_peak)
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
%        climb_height: the current "altitude" of the climb
%
%        answer_09: a code that is set if the correct previous highest_peak
%        is entered. It will be empty if highest_peak is missing, blank, or
%        wrong.
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

% Revision history:
% 2023_02_03:
% -- wrote the code originally
% 2023_02_15: 
% -- Corrected the argument order in the grading function call
% 2023_02_19
% -- Fixed error where flag_entry_was_checked is set even in setup calls

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
dependencies = 'fcn_CodeX_08_RedLightGreenLight,fcn_CodeX_09_ToTheTopOfTheMountain';
dependencies_cells = [{'fcn_CodeX_08_RedLightGreenLight'},{'fcn_CodeX_09_ToTheTopOfTheMountain'}];

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(2,nargin_lock_number);    
end

student_entry_key = varargin{1};
student_number = varargin{2};

highest_peak_guess = [];
if nargin==3
    if ~isempty(varargin{3})
        flag_try_answer = 1;
        highest_peak_guess = varargin{3};
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
% Only need to do this once, and remember only if an answer is attempted
persistent flag_entry_was_checked_09
if isempty(flag_entry_was_checked_09)
    fcn_INTERNAL_checkEntryKey(this_fname, student_number,student_entry_key,dependencies, dependencies_cells);
    if (flag_try_answer == 1)
        flag_entry_was_checked_09 = 1;
    end
end

%% Step 1 - generate the hill climb sequence and fill the initial values
% Define the hill climbing variables
persistent climb_elevation % This is how high we are at present
persistent climb_height_durations % This is how many "moves" the light is on or off in each particular sequence
persistent most_recent_highest_peak % This is the most recent highest peak encountered
persistent current_sequence_count % This is the current value in the climb sequence (e.g. how many steps into the current sequence we are)
persistent current_climb_sequence % This is the integer for the current climb sequence. For example, if we go up first then this is sequence 1. Then the down part would be 2, the next up part would be 3, etc.


% fill in the initial values
if isempty(climb_elevation)
    climb_elevation = 0;
end
if isempty(climb_height_durations)
    % Set the random number generator for the specific student
    rng(student_number);

    % Generate a list of random numbers
    N_digits = 2;
    N_numbers = 10000; % This is the number of up/down sequences
    climb_height_durations = ceil(10^N_digits * rand(N_numbers,1));
end
if isempty(most_recent_highest_peak)
    most_recent_highest_peak = nan;
end
if isempty(current_sequence_count)
    current_sequence_count = 1;
end
if isempty(current_climb_sequence)
    current_climb_sequence = 1;
end

%% Step 2 - check for a player guess
happy_word = upper('welldone');
answer_09 = [];
if (0~=flag_try_answer) 
    if isequal(most_recent_highest_peak,highest_peak_guess) % Was the previous peak equal to the player's guess?
        correct_answer = fcn_CodeX_calculateNameHash(sprintf('%.0d',student_number),happy_word);
        answer_09 = correct_answer;
        fprintf(1,'Player has found the highest peak! The answer string to this challenge is: ''%s''\n', answer_09);
    else
        fprintf(1,'Incorrect highest peak. Imposing a 5-second climb delay.\n');
        pause(5);
    end
end

%% Step 3 - advance the climb
climb_amount = rand;

% Is it going up or down?
if mod(current_climb_sequence,2)==1
    % Going_up
    climb_height_direction = 1;
else
    % Going down
    climb_height_direction = -1;
end

% Save the result
climb_elevation = climb_elevation + climb_height_direction*climb_amount;
climb_height = climb_elevation;

% Advance the move index of the current climb
current_sequence_count = current_sequence_count+1;

% Check if the climb direction needs to change
if current_sequence_count>climb_height_durations(current_climb_sequence)
    current_climb_sequence = current_climb_sequence+1; % Start next sequence
    current_sequence_count = 1; % Reset current sequence count back to 1
    most_recent_highest_peak = climb_elevation;
end

% Check if we are at the end of all the possible sequences. If so, just go
% back to the first sequence
if current_climb_sequence>length(climb_height_durations)
    current_climb_sequence = 1;
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
        correct_answer = fcn_CodeX_calculateNameHash(sprintf('%.0d',student_number),happy_word);
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
        climb_height = temp_output;
             
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
function fcn_INTERNAL_checkEntryKey(file_name, student_number,student_entry_key,dependencies, dependencies_cells)

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





