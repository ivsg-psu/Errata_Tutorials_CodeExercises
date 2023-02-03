function output_result = fcn_CodeX_04_doubleOrNothing(varargin) %#ok<FNDEF> 
%FCN_CODEX_04_DOUBLEORNOTHING - find a number in a list
%   
%   Welcome to FCN_CODEX_04_DOUBLEORNOTHING . In this assignment, you are
%   asked to find, from a vector of 50 random numbers, the one number hidden in
%   the set that is EXACTLY twice as big as one of the other 49 numbers. The
%   correct answer is the row of the "double" number. For example, say we
%   call the function:
%
%   random_vector = fcn_CodeX_04_doubleOrNothing(entry_key,student_number);
%
%   and it produces the following: (only showing the first five entries)
%
%   random_vector =
% 
%     0.5681
%     0.2876
%     0.4362
%     0.8021
%     0.1438 
%    
%
%   One can observe that the 2nd row is twice the value of the 5th row.
%   Thus, the answers to this function would be 2, as the 2nd row is hiding
%   a number that is twice the value of another number.
%
%   answer_04 = 2;
%
%   This assignment is easiest completed by writing your own function. And
%   yes, there is a solution that solves this with only one line of code in
%   the function.
%
%   As in all the assignments, to check if the answer is correct, call
%   fcn_GradeCode and pass in the function name, student number, and answer.
% 
%   For example, to solve this, one could type in their script or at the
%   MATLAB prompt:
% 
%            entry_key = ' 234ADH&45'; % <--- this must be changed
%            student_number = 123; % <--- this must be changed                      
%            random_vector = fcn_CodeX_04_doubleOrNothing(entry_key,student_number);
%            answer_04 = fcn_CodeX_04_YOURFUNCTIONHERE(random_vector);
%
%   And then to grade the answer, one can call the grader function:
%
%            fcn_GradeCodeX('fcn_CodeX_04_doubleOrNothing',student_number, answer_04);
%
%   If the answer is right, the grader prints information and gives the
%   entry code for the next problem. And if wrong, it indicates it is
%   wrong.

%   What does this code do? 
%
%   FORMAT:
%
%        random_vector = fcn_CodeX_03_headsOrTails(entry_key,student_number)
%
%   INPUTS:
%
%        entry_key: the entry key for the function, given by the
%        fcn_GradeCodeX operations
%
%        student_number: the student number. It must match the prior
%        numbers used in the fcn_GradeCodeX operations
%
%   OUTPUTS:
%
%        random_vector: a vector of 50 random numbers
%
%   DEPENDENCIES:
%
%        fcn_DebugTools_checkInputsToFunctions
%
%   EXAMPLES:
%
%       See the script: script_demo_CodeX.m
%
%   This function was written on 2023_02_01 by S. Brennan Questions or
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
dependencies = 'fcn_CodeX_03_headsOrTails, fcn_CodeX_04_doubleOrNothing';
dependencies_cells = fcn_DebugTools_parseStringIntoCells(dependencies);


if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(2,nargin_lock_number);    
end

student_entry_key = varargin{1};
student_number = varargin{2};

if nargin==nargin_lock_number
    Grader_input_code = varargin{nargin_lock_number};    
elseif nargin>2 % Force an error
    narginchk(0,0);
end


% Find the filename, and strip out debug mode characters if necessary
% st = dbstack; 
% this_fname = st(1).name;
% if contains(this_fname,'_KEEP')
%     this_fname = this_fname(1:end-5);
% end
% this_fname = upper(this_fname);
this_fname = 'fcn_CodeX_04_doubleOrNothing';


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
student_number_string = sprintf('%.0d',student_number);

% Next, make sure student's entry code matches. To do this, we calculate
% the inverse name_hash to see if the user specified the right function
inverse_entry = fcn_CodeX_calculateNameHash(student_number_string,student_entry_key);
if ~(strcmpi(inverse_entry,this_fname) || any(strcmpi(inverse_entry,dependencies_cells)))
    if strcmp(inverse_entry(1:3),'FCN')
        error('It appears the entry key for the wrong function was given. The entry key was for function: \n\t%s \nBut this function requires the entry key for one of the following: \n\t%s',inverse_entry,upper(dependencies));
    else
        error('Incorrect entry key given for this function. This function requires entry key for one of the following: \n\t%s',upper(dependencies));
    end
end

%% Step 1 - generate the list
% Set the random number generator for the specific student
rng(student_number);

% Generate a list of random numbers
N = 50;
random_list = rand(N,1);

% Choose a source and destination by randomly selecting 2 indices
random_indices = randperm(N,2);
row_being_doubled = random_indices(1);
row_that_is_the_double = random_indices(2);

% Grab the random number from the source - make sure it can be doubled
source = random_list(row_being_doubled);
if source >= 0.5
    source = source/2;
end

% Fill in the list with the source and destination values
random_list(row_being_doubled,1)        = source;
random_list(row_that_is_the_double)     = source*2;

% Fill in the output with the list
output_result = random_list;


%% Step 2 - grade student answer
% Do we enter grading mode?
if nargin==nargin_lock_number

        
    % Calculate the lock value so that Grader can check entry value
    date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname);

    % Grader entered the correct value?
    if strcmp(Grader_input_code,date_lock_value)
        % Grader is correct - return requested information
        % 1) Return the correct answer   
        correct_answer = row_that_is_the_double;
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
        output_result = temp_output;
             
    else % Force an error
        narginchk(0,0);
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
    fprintf(1,'Scrambled input: %s\n',output_result);
    second_scrambled_string = fcn_INTERNAL_scrambleString(output_result,scrambler_string);
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

%% fcn_INTERNAL_calculateDateLockValue
function date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname)
which_result = which(this_fname);
if isempty(which_result)
    error('Unable to find self file - quitting.');
end
file_listing = dir(which_result);
date_lock_value = file_listing(1).date;
end % Ends fcn_INTERNAL_calculateDateLockValue


%% fcn_INTERNAL_getMACaddress
function mac_string = fcn_INTERNAL_getMACaddress
networkinterfaces = java.net.NetworkInterface.getNetworkInterfaces;
nimacs = cell(0, 2);
while networkinterfaces.hasMoreElements
     networkinterface = networkinterfaces.nextElement;
     macstring = strjoin(cellstr(dec2hex(typecast(networkinterface.getHardwareAddress, 'uint8'))), ':');
     nimacs = [nimacs; {char(networkinterface.getDisplayName), macstring}]; %#ok<AGROW>
end

mac_string = [];
for ith_address = 1:length(nimacs(:,1))
    data = nimacs{ith_address,2};
    if ~isempty(data)
        mac_string  = cat(2,mac_string,data);
    end
end
mac_string = upper(mac_string);
end % Ends fcn_INTERNAL_getMACaddress

function scrambled_string = fcn_INTERNAL_scrambleString(string_to_convert,scrambler_string)
%% fcn_INTERNAL_scrambleString
% This function scrambles a string using the XOR hash method
% It goes letter by letter through the string to convert, and for each
% letter, takes a letter out of the scrambler string and XORs with that
% letter, cycling through the scrambler string beginning once it reaches
% the end. To keep the letters readable, it unit shifts letters down by 32,
% and performs operations only up to 63 after the shift, thereby forcing
% the results to only occur in 6 bits maximum. It then shifts the results
% back up by 32, producing readable characters. One consequence of this
% readability is that only upper case letters can be used, and no letters
% higher than 96 on the ASCII table. The code checks for both cases.


% ASCII Table, readable form, goes from 33 to 127
starting_ASCII = 32;
ending_ASCII = starting_ASCII+63; % Force the result to only use bottom 64 bits
ASCII_range = ending_ASCII - starting_ASCII + 1;

% Convert strings to numbers, and check them
numbers_to_convert = uint8(string_to_convert);
scrambler_numbers = uint8(upper(scrambler_string));

% Make sure these are well formed
if ~strcmp(upper(string_to_convert),string_to_convert)
    error('Only upper case letters allowed for conversion string');
end
   
if any(numbers_to_convert<starting_ASCII)
    error('Conversion string has characters that are not convertible because they are too low in ASCII table');
end
if any(scrambler_numbers<starting_ASCII)
    error('Scrambler string has characters that are not convertible because they are too low in ASCII table');
end
if any(numbers_to_convert>ending_ASCII)
    error('Conversion string has characters that are not convertible because they are too high in ASCII table');
end
if any(scrambler_numbers>ending_ASCII)
    error('Scrambler string has characters that are not convertible because they are too high in ASCII table');
end


% Initial values
Nconversions = length(string_to_convert);   
scrambled_numbers_shifted = zeros(1,Nconversions,'uint8');
jth_scrambler = 1; % Start at first character
shiftedNumbersToConvert = numbers_to_convert - starting_ASCII;
shiftedScramblerNumbers = scrambler_numbers - starting_ASCII;


% Scrambled 
for ith_conversion = 1:Nconversions

    charNumber_to_convert = shiftedNumbersToConvert(ith_conversion);
    scrambler_number = shiftedScramblerNumbers(jth_scrambler);
    
    % Do the scramble
    scrambled_numbers_shifted(ith_conversion) = bitxor(charNumber_to_convert,scrambler_number);
    
    % Increment the scrambler
    jth_scrambler = 1+mod(ith_conversion,length(scrambler_string));
end

% Check for errors
if any(scrambled_numbers_shifted>=ASCII_range)
    error('Bit overload error! This should not have happened.');
end
scrambled_numbers_unshifted = scrambled_numbers_shifted + starting_ASCII;
scrambled_string = char(scrambled_numbers_unshifted);

end % Ends the function


