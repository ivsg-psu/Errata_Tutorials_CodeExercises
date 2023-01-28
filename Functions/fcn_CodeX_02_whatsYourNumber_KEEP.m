function scrambled_answer = fcn_CodeX_02_whatsYourNumber(varargin)
%FCN_CODEX_01_GETKEY - generate student and computer-specific key
%   
%   Welcome to FCN_CODEX_01_GETKEY . In this assignment, you are asked to
%   write code that queries this function, FCN_CODEX_01_GETKEY, with no
%   arguments or inputs. The solution is literally one line of code that
%   requests a code key (a strange set of characters) from the function.
%   For example, to query a function called "fcn_be_happy" that produces a
%   result "a", you would type in their script or at the MATLAB prompt:
%
%                      a = fcn_be_happy;
%
%   This assignment asks students to write their own line of code for this
%   function. And yes, it is stupidly easy.
%
%   To check if the answer is correct, call fcn_GradeCode. For example, if
%   you stored the result as "a" like in the example above, you would call:
%
%   right_or_wrong = fcn_GradeCodeX(a);
%
%   If you are right, the grader prints information and gives you the next
%   problem. If you are wrong, it gives a red text that says you are wrong
%   and perhaps a hint to help you. May this message be enough to get you
%   started on your code journey - the first step is always the hardest!

%   What does this code do? Finds computer information, and uses it to form a
%   key sequence. This key sequence is used in later problems to encrypt
%   results and to ensure results for each student are done on different
%   computers with different logins. The key has identifier fields that are
%   unique to the student, computer, and software:
%
%   1: MAC address
%
%   2: Function name being called
%
%   3: MATLAB license number
%
%   4: MATLAB version
%
%   5: The computer's hostname on the network
%
%   6: The computer's name in the OS0
%
%   7: The operating system type (PC, MAC, or UNIX) and MATLAB type (student or full version?) 
%
%   8: The user's network login name as reported by the network
%
%   These are then encrypted using a fixed, rotating hash unique to the
%   computer.
%
%   FORMAT:
%
%        scrambled_key = fcn_CodeX_01_getKey(varargin)
%
%   INPUTS:
%
%        (none)
%
%   OUTPUTS:
%
%        scrambled_key: a key containing the above fields
%
%   DEPENDENCIES:
%
%        fcn_DebugTools_checkInputsToFunctions
%
%   EXAMPLES:
%
%       See the script: script_demo_CodeX.m
%
%   This function was written on 2023_01_23 by S. Brennan Questions or
%   comments? sbrennan@psu.edu

% Revision history: 2023_01_23: -- wrote the code originally

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
dependencies = ['fcn_CodeX_01_getKey, fcn_CodeX_02_whatsYourNumber, fcn_CodeX_03_headsOrTails, fcn_CodeX_04_doubleOrNothing'];
dependencies_cells = fcn_DebugTools_parseStringIntoCells(dependencies);

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(0,nargin_lock_number);    
end

if nargin==nargin_lock_number
    student_entry_key = varargin{1};
    student_number = varargin{2}; 
    Grader_input_code = varargin{nargin_lock_number};    
elseif nargin>2 % Force an error
    narginchk(0,0);
end

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
% Find the filename, and strip out debug mode characters if necessary
st = dbstack; 
this_fname = st(1).name;
if contains(this_fname,'_KEEP')
    this_fname = this_fname(1:end-5);
end
this_fname = upper(this_fname);

student_number_string = sprintf('%.0d',student_number);

% 
% correct_entry_key = fcn_CodeX_calculateNameHash(student_number_string,this_fname);
% if ~isequal(correct_entry_key,student_entry_key)
%     error('The entry key for this function is incorrect. Note that the entry key depends on student number and the computer. Run fcn_GradeCodeX to get entry keys.');
% end


% Make sure student's entry code matches
% Calculate the inverse name_hash to see if the user specified the right
% function

inverse_entry = fcn_CodeX_calculateNameHash(student_number_string,student_entry_key);
if ~(strcmpi(inverse_entry,this_fname) || any(strcmpi(inverse_entry,dependencies_cells)))
    if strcmp(inverse_entry(1:3),'FCN')
        error('It appears the entry key for the wrong function was given. The entry key was for function: \n\t%s \nBut this function requires the entry key for one of the following: \n\t%s',inverse_entry,upper(dependencies));
    else
        error('Incorrect entry key given for this function. This function requires entry key for one of the following: \n\t%s',upper(dependencies));
    end
end

%% Step 1 - get computer data
%   1: MAC address
%
%   2: Function name being called
%
%   3: MATLAB license number
%
%   4: MATLAB version
%
%   5: The computer's hostname on the network
%
%   6: The computer's name in the OS0
%
%   7: The operating system type (PC, MAC, or UNIX) and MATLAB type (student or full version?) 
%
%   8: The user's network login name as reported by the network


% Get the MAC address
key_string{1} = fcn_INTERNAL_getMACaddress;

% Get the function name
st = dbstack; 
% fprintf(1,'STARTING function: %s, in file: %s\n',st(1).name,st(1).file);
key_string{2} = st(1).name;

% Get the MATLAB license number
key_string{3} = license;

% Get MATLAB version
key_string{4} = version;

% % Convert the hex into dec
% temp = regexp(key_string{2},':','split');
% temp2 = hex2dec(temp)+255;
% macDecString = sprintf('%.0d',temp2);
% macDecNum = str2double(macDecString); %#ok<NASGU>

% Get the computer host name
[ret, name] = system('hostname');   
if ret ~= 0
   if ispc
      name = getenv('COMPUTERNAME');
   else      
      name = getenv('HOSTNAME');      
   end
end
key_string{5} = strtrim(lower(name));

% Get computer name
key_string{6} = computer;


% Get OS and MATLAB Type
type = 1*ispc + 2*ismac + 4*isunix + 8*isstudent;
key_string{7} = sprintf('%.0d',type);

% Get login username
key_string{8} = getenv('UserName');


%% Step 2 - % Now we need to assemble the results into a string
% Create the string
CSV_answer_string = [];
for ith_key = 1:length(key_string)
    CSV_answer_string = cat(2,CSV_answer_string,sprintf('%s',key_string{ith_key}));
    if ith_key<length(key_string)
        CSV_answer_string = cat(2,CSV_answer_string,', ');
    end
end

%% Step 3 - scramble the results
string_to_convert = upper(CSV_answer_string);
scrambling_hash = fcn_INTERNAL_getMACaddress;
scrambled_answer = fcn_INTERNAL_scrambleString(string_to_convert,scrambling_hash);


%% Step 4 - grade student answer

if nargin==nargin_lock_number

        
    % Calculate the lock value so that Grader can check
    date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname);

    % Grader entered the correct value?
    if strcmp(Grader_input_code,date_lock_value)
        % Grader is correct - return requested information
        % 1) Return the correct answer        
        temp{1} = scrambled_answer; 
        
        % 2) Grade the students answer
        student_answer = varargin{3};
        if(isequal(scrambled_answer,student_answer))
            temp{2} = true;
        else
            temp{2} = false;
        end
        
        % 3) Identify the function dependencies - NOTE: a function must
        % always be self-dependent!
        temp{3} = dependencies; % 
        scrambled_answer = temp;
             
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
    fprintf(1,'Scrambled input: %s\n',scrambled_answer);
    second_scrambled_string = fcn_INTERNAL_scrambleString(scrambled_answer,scrambler_string);
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
date_lock_value = sprintf('%.0f',file_listing(1).datenum);
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

