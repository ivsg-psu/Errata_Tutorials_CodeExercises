function [light_signal_status, player_position, answer_08] = ...
    fcn_CodeX_08_RedLightGreenLight(varargin) %#ok<FNDEF> 
%FCN_CODEX_08_REDLIGHTGREENLIGHT - find odd numbers
%   
%   Welcome to FCN_CODEX_08_REDLIGHTGREENLIGHT . This assignment pays
%   homage to the very famous children's game called "Red Light, Green
%   Light". As upcoming assignments will show, this game is also very
%   relevant to capitalism!
%
%   For those who have never played the game, the instructions can be
%   found at many websites, for example:
%
%       https://www.playworks.org/game-library/red-light-green-light/
%
%   And are copied here:
%
%  Start with everyone along the starting line, When you say 'Green Light'
%  everyone will move towards the finish line, When you say 'Red Light'
%  everyone must immediately stop. If players are still moving when you
%  call 'Red Light', they must go back to the starting line.
% 
%   Specifically: this function "plays" red-light-green-light with you by
%   acting as a signal. If the function is called without a "move":
%
%   light_signal =
%   fcn_CodeX_08_RedLightGreenLight(entry_key,student_number);
% 
%   It will return a 0 if the light is "red", and 1 if the light is
%   "green". If the previous reading is "green", you are allowed to move
%   by inserting a non-zero move command:
%
%   move_command = 1;
%   light_signal_status =
%   fcn_CodeX_08_RedLightGreenLight(entry_key,student_number,move_command);
%
%   The function will then advance the player forward by 1 space and prints
%   the player's position. As well, it returns the next light signal.
% 
%   But if the light is "red" during a move command, then the player has to
%   go back to the start line and the player's position is set back to
%   zero. 
%
%   The finish line is set at 1000 steps. Once a player crosses the finish
%   line, the function will output the answer_08 string that can be used in
%   the grading routine to complete the assignment. This can also be
%   queried directly from the function as additional output arguments:
%
%   [light_signal_status, player_position, answer_08] =
%   fcn_CodeX_08_RedLightGreenLight(entry_key,student_number,move_command);
%
%   The answer_08 code will be empty until the "finish line" is crossed.
%
%   As in all the assignments, to check if the answer is correct, call
%   fcn_GradeCode and pass in the function name, student number, and answer.
%
%   fcn_GradeCodeX('fcn_CodeX_08_RedLightGreenLight', answer, student_number);
%
%   If the answer is right, the grader prints information and gives the
%   entry code for the next problem. And if wrong, it indicates it is
%   wrong.

%   What does this code do? 
%
%   FORMAT:
%
%        [light_signal_status, player_position, answer_08] = ...
%        fcn_CodeX_08_RedLightGreenLight((entry_key,student_number,move_command)
%
%   INPUTS:
%
%        entry_key: the entry key for the function, given by the
%        fcn_GradeCodeX operations
%
%        student_number: the student number. It must match the prior
%        numbers used in the fcn_GradeCodeX operations
%
%        move_command: an optional command to move. Set to anything other
%        than zero to request a "move".
%
%   OUTPUTS:
%
%        light_signal_status: a 1 (green) or 0 (red) indication of the
%        current light
%
%        player_position: the count value of where the player is currently
%        standing
%
%        answer_08: a code that is set of the player crosses the finish
%        line
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
dependencies = 'fcn_CodeX_07_thatsOdd,fcn_CodeX_08_RedLightGreenLight';
dependencies_cells = [{'fcn_CodeX_07_thatsOdd'},{'fcn_CodeX_08_RedLightGreenLight'}];

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(2,nargin_lock_number);    
end

student_entry_key = varargin{1};
student_number = varargin{2};

if nargin==3
    if ~isempty(varargin{3})
        flag_try_move = varargin{3};
    else
        flag_try_move = 0;
    end
else
    flag_try_move = 0;
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

this_fname = 'fcn_CodeX_08_RedLightGreenLight';


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
persistent flag_entry_was_checked
if isempty(flag_entry_was_checked)
    fcn_INTERNAL_checkEntryKey(this_fname, student_number,student_entry_key,dependencies, dependencies_cells);
    flag_entry_was_checked = 1;
end

%% Step 1 - generate the light sequence and fill the light value
% Define the light sequencing variables
persistent light_signal_durations % This is how many "moves" the light is on or off in each particular sequence
persistent current_light_sequence % This is the red or green light sequence - even numbers are red, odd numbers are green
persistent current_sequence_count % This is the current value in the sequence (e.g. how many steps into the current sequence we are)
persistent player_position_internal % This is the location of the player
persistent last_light_signal % The last light signal

% fill in the initial values
if isempty(light_signal_durations)
    % Set the random number generator for the specific student
    rng(student_number);

    % Generate a list of random numbers
    N_digits = 2;
    N_numbers = 10000; % This is the number of red/green sequences
    light_signal_durations = ceil(10^N_digits * rand(N_numbers,1));
end
if isempty(current_light_sequence)
    current_light_sequence = 1;
end
if isempty(current_sequence_count)
    current_sequence_count = 1;
end
if isempty(player_position_internal)
    player_position_internal = 0;
end
if isempty(last_light_signal)
    last_light_signal = 1;
end

%% Step 2 - check for a move
if (0~=flag_try_move) 
    if last_light_signal==1 % Was the previous light green?
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
if mod(current_light_sequence,2)==1
    % Green light
    light_signal_status = 1;
else
    % Red light
    light_signal_status = 0;
end

% Save the result
last_light_signal = light_signal_status;

% Advance the moves of the current light
current_sequence_count = current_sequence_count+1;

% Check if the light needs to change
if current_sequence_count>light_signal_durations(current_light_sequence)
    current_light_sequence = current_light_sequence+1; % Start next sequence
    current_sequence_count = 1; % Reset current sequence count back to 1
end

% Check if we are at the end of all the possible sequences. If so, just go
% back to the first sequence
if current_light_sequence>length(light_signal_durations)
    current_light_sequence = 1;
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
        light_signal_status = temp_output;
             
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





