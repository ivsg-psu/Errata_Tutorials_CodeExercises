function scrambled_key_answer = fcn_CodeX_02_whatsYourNumber(unlock_key_problem1,your_number,varargin)
% In a previous assignment, you were asked to practice calling a function
% with no arguments. In this assignment, you are asked to write code that
% again calls a function, fcn_CodeX_02_whatsYourNumber, but this time you
% must pass in your student number. It will again return a "key" that you
% can use to grade your work. What you pass a function is called the
% "argument"; for example, in the code below, the variable "your_number" is
% the argument and when the function is called, the value of 2 is sent into
% the function because this is what "your_number" contains. The choice of
% your_number should match the one you use for quizzes and exams, if you
% are taking a class.
%
% your_number = 2; % Put your number in here!
% result_key_problem_2 = fcn_CodeX_02_whatsYourNumber(unlock_key_problem1,your_number);
%
% In the assignments that follow, we will use  your selected number and key
% to initialize the problem so that each problem is just for you. And we
% check that they aren't repeated, so pick one that nobody else will know.
% Plus, this helps us debug your work if you hit problems, as we can use
% your key to initialize the problem as if we are you. As well, we again
% use the "GradeCode" routine to check your work, but for this, we will
% pass 2 arguments: the problem number, and your key.
% 
% problem_number = 2;
% unlock_key_problem_3 = fcn_GradeCodeX(problem_number, your_number, result_key_problem_2);
%
% As before: if you are right, the grader prints information and gives you
% the next problem. Keep up the hard work!

% What this code does?
% Finds computer information, and uses it to form a key sequence. This key
% sequence is used in later problems to encrypt results and to ensure
% results for each student are done on different computers with different
% logins. The key has 7 fields:
% 1: MATLAB license number
% 2: MAC Address
% 3: The computer hostname on the network
% 4: The computer's name
% 5: The MATLAB version
% 6: The operating system and MATLAB type (student or full version?)
% 7: The user's login name
% These are then encrypted using a fixed, rotating hash unique to the
% computer.
%
% FORMAT:
%
%      scrambled_key = fcn_CodeX_01_getKey(varargin)
%
% INPUTS:
%
%      (none)
%
% OUTPUTS:
%
%      scrambled_key: a key containing the above fields
%
% DEPENDENCIES:
%
%      fcn_DebugTools_checkInputsToFunctions
%
% EXAMPLES:
%
%     See the script: script_demo_CodeX.m
%
% This function was written on 2023_01_23 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% Revision history:
% 2023_01_23:
% -- wrote the code originally 

% TO DO
% -- Add input argument checking

lock_value = 24;

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

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(2,7);    
end

grading_mode = 0;
if nargin==7
    code_value = varargin{7};    
    grading_mode = 1;
else % Force an error
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
%% Get key string and confirm it is correct
scrambled_key = fcn_CodeX_INTERNAL_getKey;

if 0==grading_mode

    if ~isequal(scrambled_key,unlock_key_problem1)
        error('Unlock key does not work - unable to do problem! If you did the problem on another computer or another account, you will have to regenerate the key.');
    end
    
    %% Hash the key again with the student's number
    string_to_convert = scrambled_key;
    scrambling_hash = sprintf('%.0d',your_number);
    scrambled_key_answer = fcn_INTERNAL_scrambleString(string_to_convert,scrambling_hash);
    
    %% Check student answer and share hash string
end
if nargin==7
    if isequal(code_value,lock_value)
        temp{1} = scrambled_key_answer; 
        student_answer = varargin{1};
        if(isequal(scrambled_key,student_answer))
            temp{2} = true;
        else
            temp{2} = false;
        end
        % Pass out the results
        scrambled_key_answer = temp;
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
    
    
    %     fprintf(1,'Input before scramble: %s\n',string_to_convert);
    %     fprintf(1,'Scrambler: %s\n',scrambler_string);
    %     fprintf(1,'Scrambled input: %s\n',scrambled_key);
    %     second_scrambled_string = fcn_INTERNAL_scrambleString(scrambled_key,scrambler_string);
    %     fprintf(1,'Result after second scramble: %s\n',second_scrambled_string);
    


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

function scrambled_key = fcn_CodeX_INTERNAL_getKey(varargin)

%% Step 1 - get computer data

% Get the MATLAB license number
key_string{1} = license;

% Get the MAC address
networkinterfaces = java.net.NetworkInterface.getNetworkInterfaces;
nimacs = cell(0, 2);
while networkinterfaces.hasMoreElements
     networkinterface = networkinterfaces.nextElement;
     macstring = strjoin(cellstr(dec2hex(typecast(networkinterface.getHardwareAddress, 'uint8'))), ':');
     nimacs = [nimacs; {char(networkinterface.getDisplayName), macstring}]; %#ok<AGROW>
end

key_string{2} = [];
for ith_address = 1:length(nimacs(:,1))
    data = nimacs{ith_address,2};
    if ~isempty(data)
        key_string{2}  = cat(2,key_string{2},data);
    end
end
scrambling_hash = upper(key_string{2});



% Convert the hex into dec
temp = regexp(key_string{2},':','split');
temp2 = hex2dec(temp)+255;
macDecString = sprintf('%.0d',temp2);
macDecNum = str2double(macDecString); %#ok<NASGU>

% Get the computer host name
[ret, name] = system('hostname');   
if ret ~= 0
   if ispc
      name = getenv('COMPUTERNAME');
   else      
      name = getenv('HOSTNAME');      
   end
end
key_string{3} = strtrim(lower(name));

% Get computer name
key_string{4} = computer;

% Get MATLAB version
key_string{5} = version;

% Get OS and MATLAB Type
type = 1*ispc + 2*ismac + 4*isunix + 8*isstudent;
key_string{6} = sprintf('%.0d',type);

% Get login username
key_string{7} = getenv('UserName');


%% Step 2 - % Now we need to assemble the results into a string
% Create the string
CSV_string = [];
for ith_key = 1:length(key_string)
    CSV_string = cat(2,CSV_string,sprintf('%s',key_string{ith_key}));
    if ith_key<length(key_string)
        CSV_string = cat(2,CSV_string,', ');
    end
end

%% Step 3 - scramble the results
string_to_convert = upper(CSV_string);
scrambled_key = fcn_INTERNAL_scrambleString(string_to_convert,scrambling_hash);


%% Step 4 - check student answer and share hash string

if nargin==7
    if isequal(code_value,lock_value)
        temp{1} = scrambled_key; 
        student_answer = varargin{1};
        if(isequal(scrambled_key,student_answer))
            temp{2} = true;
        else
            temp{2} = false;
        end
        scrambled_key = temp;
    else % Force an error
        narginchk(0,0);
    end
end

end % Ends fcn_CodeX_INTERNAL_getKey

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

