function true_or_false = fcn_CodeX_06_aLongPass(varargin) %#ok<FNDEF> 
%FCN_CODEX_06_ALONGPASS - find the LONG integer password
%   
%   Welcome to FCN_CODEX_06_ALONGPASS . In this assignment, like a previous
%   one, the goal is to guess an integer password. But unlike the previous
%   case, now it could be a LONG password - up to 8 digits.
% 
%   Specifically: this function returns false for any integer "guess" that
%   is NOT equal to the correct password. It returns true for the correct
%   integer password. The password is the answer to the problem.
%
%   true_false =
%   fcn_CodeX_06_aLongPass(entry_key,student_number,guess);,
%
%   As in all the assignments, to check if the answer is correct, call
%   fcn_GradeCode and pass in the function name, student number, and answer.
% 
%   For example, if the correct password is 12345678, then the following would
%   produce a "true" result.
% 
%            entry_key = ' 234ADH&45'; % <--- this must be changed
%            student_number = 123; % <--- this must be changed   
%            guess = 12345678;
%            true_false = fcn_CodeX_06_aLongPass(entry_key,student_number,guess);
%
%   And then to grade the answer, one can call the grader function:
%
%            fcn_GradeCodeX('fcn_CodeX_06_aLongPass',student_number, guess);
%
%   If the answer is right, the grader prints information and gives the
%   entry code for the next problem. And if wrong, it indicates it is
%   wrong.

%   What does this code do? 
%
%   FORMAT:
%
%        true_or_false = fcn_CodeX_06_aLongPass(entry_key,student_number,guess)
%
%   INPUTS:
%
%        entry_key: the entry key for the function, given by the
%        fcn_GradeCodeX operations
%
%        student_number: the student number. It must match the prior
%        numbers used in the fcn_GradeCodeX operations
%
%        guess: the guess of the password (assumed to be integer)
%
%   OUTPUTS:
%
%        true_or_false: a vector of true or false values, if password
%
%   DEPENDENCIES:
%
%        fcn_DebugTools_checkInputsToFunctions
%
%   EXAMPLES:
%
%       See the script: script_demo_CodeX.m
%
%   This function was written on 2023_02_02 by S. Brennan Questions or
%   comments? sbrennan@psu.edu

% Revision history: 2023_02_01: -- wrote the code originally

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
dependencies = 'fcn_CodeX_05_whatsThePassword, fcn_CodeX_06_aLongPass';
dependencies_cells = fcn_DebugTools_parseStringIntoCells(dependencies);


if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(3,nargin_lock_number);    
end

student_entry_key = varargin{1};
student_number = varargin{2};
guess = varargin{3};


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

this_fname = 'fcn_CodeX_06_aLongPass';


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
fcn_INTERNAL_checkEntryKey(this_fname, student_number,student_entry_key,dependencies_cells);

%% Step 1 - generate the answer
% Set the random number generator for the specific student
rng(student_number);

% Generate a list of random numbers
N_digits = 8;
correct_answer = floor(10^N_digits * rand);

% Fill in the output with the list
true_or_false = guess==correct_answer;


%% Step 2 - grade student answer
% Do we enter grading mode?
if nargin==nargin_lock_number

        
    % Calculate the lock value so that Grader can check entry value
    date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname);

    % Grader entered the correct value?
    if strcmp(Grader_input_code,date_lock_value)
        % Grader is correct - return requested information
        % 1) Return the correct answer   
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
        true_or_false = temp_output;
             
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
    
    % Define a scrambler string?
    % FOR DEBUGGING: CSV_string = 'This is a big test';
    % FOR DEBUGGING: CSV_string = char(32:(32+63));
    % string_to_convert = upper(CSV_string);
    
    
    fprintf(1,'Input before scramble: %s\n',string_to_convert);
    fprintf(1,'Scrambler: %s\n',scrambler_string);
    fprintf(1,'Scrambled input: %s\n',true_or_false);
    second_scrambled_string = fcn_INTERNAL_scrambleString(true_or_false,scrambler_string);
    fprintf(1,'Result after second scramble: %s\n',second_scrambled_string);
    


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





