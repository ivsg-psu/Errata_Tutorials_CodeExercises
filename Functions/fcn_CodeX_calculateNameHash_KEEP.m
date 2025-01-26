function name_hash = fcn_CodeX_calculateNameHash(student_number_string, string_2_hash, varargin) %#ok<FNDEF>
%% fcn_CodeX_calculateNameHash
% This is a helper function for the CodeX library that hashes strings. It
% it not a problem to be solved, but rather a function that is used often
% in many of the problems and so is kept as a stand-alone function.

% name_hash = fcn_CodeX_calculateNameHash(student_number_string,string_2_hash)
% Creates a hashed output string using the XOR hashing. Includes
% interlacing of the computer's MAC address to force results to be computer
% specific. Checks also that the the output is within the correct ASCII
% character space so that results are printable, e.g. that they have no
% line feeds, carrage returns, etc.
%
% FORMAT:
%
%      name_hash = fcn_CodeX_calculateNameHash(student_number_string,string_2_hash)
%
% INPUTS:
%
%      student_number_string: a string usually containing the student
%      number or student identifier
%
%      string_2_hash: the string that should be XOR hashed
%
%      (OPTIONAL INPUTS)
%
%      (none)
%
% OUTPUTS:
%
%      name_hash: the hashed output using XOR hashing
%
% DEPENDENCIES:
%
%      (none)
%
% EXAMPLES:
%
%     See the script: script_test_fcn_CodeX_calculateNameHash
%     for a full test suite.
%
% This function was written on 2023_01_25 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% Revision history
%      2025_01_24:
%      -- refined examples, more comments, better interlacing

%% Debugging and Input checks

% Check if flag_max_speed set. This occurs if the fig_num variable input
% argument (varargin) is given a number of -1, which is not a valid figure
% number.
flag_max_speed = 0;
if (nargin==3 && isequal(varargin{end},-1))
    flag_do_debug = 0; % % % % Flag to plot the results for debugging
    flag_check_inputs = 0; % Flag to perform input checking
    flag_max_speed = 1;
else
    % Check to see if we are externally setting debug mode to be "on"
    flag_do_debug = 0; % % % % Flag to plot the results for debugging
    flag_check_inputs = 1; % Flag to perform input checking
    MATLABFLAG_CODEX_FLAG_CHECK_INPUTS = getenv("MATLABFLAG_CODEX_FLAG_CHECK_INPUTS");
    MATLABFLAG_CODEX_FLAG_DO_DEBUG = getenv("MATLABFLAG_CODEX_FLAG_DO_DEBUG");
    if ~isempty(MATLABFLAG_CODEX_FLAG_CHECK_INPUTS) && ~isempty(MATLABFLAG_CODEX_FLAG_DO_DEBUG)
        flag_do_debug = str2double(MATLABFLAG_CODEX_FLAG_DO_DEBUG);
        flag_check_inputs  = str2double(MATLABFLAG_CODEX_FLAG_CHECK_INPUTS);
    end
end

% flag_do_debug = 1;

if flag_do_debug
    st = dbstack; %#ok<*UNRCH>
    fprintf(1,'STARTING function: %s, in file: %s\n',st(1).name,st(1).file);
    debug_fig_num = 999978; %#ok<NASGU>
else
    debug_fig_num = []; %#ok<NASGU>
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

if (0 == flag_max_speed)
    if flag_check_inputs == 1
        % Are there the right number of inputs?
        narginchk(2,3);
    end
end

% Does user want to specify fid?
fid = 0;
if (0 == flag_max_speed) && (3 <= nargin)
    temp = varargin{end};
    if ~isempty(temp)
        fid = temp;
    end
end

flag_do_plots = 0; % Nothing to plot


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


%% Make sure the student number string is of char type
if ~ischar(student_number_string)
    if isstring(student_number_string)
        student_number_string = char(student_number_string);
    else
        error('Expecting student number to be string or character');
    end
end

%% Prep the hashing string by interlacing student number with MAC, removing colons
mac_string = fcn_INTERNAL_getMACaddress;
clean_mac_string = replace(mac_string,':','');
same_length_string = fcn_INTERNAL_makeStringSameLengthAsReferenceString(clean_mac_string, student_number_string);
interlaced_string = reshape([student_number_string;same_length_string],1,[]);

name_hash = fcn_INTERNAL_scrambleString(string_2_hash,interlaced_string);


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
if (1==flag_do_plots)

    % For debugging
    fprintf(fid,'Interlaced: %s\n',interlaced);

    % Nothing to plot!

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

%% fcn_INTERNAL_makeStringSameLengthAsReferenceString
function same_length_string = fcn_INTERNAL_makeStringSameLengthAsReferenceString(string_to_lengthen_or_shorten, reference_string)
% Given a reference string and a string_to_lengthen_or_shorten, makes a
% string using repeats or clipping of the string_to_lengthen_or_shorten
% such that the output is the same length as the reference_string

% Find string lengths
length_of_input     = length(string_to_lengthen_or_shorten);
length_reference    = length(reference_string);

% Make sure both strings are same size
if length_of_input==length_reference
    % Are they the same size already?
    same_length_string = string_to_lengthen_or_shorten;
else
    % Make string longer, if it is too short
    times_longer = floor(length_reference/length_of_input)+1;
    longer_string = repmat(string_to_lengthen_or_shorten,1,times_longer);

    % Make string shorter to exactly right size
    same_length_string = longer_string(1:length_reference);
end

end % ends fcn_INTERNAL_makeStringSameLengthAsReferenceString

%% fcn_INTERNAL_scrambleString
function scrambled_string = fcn_INTERNAL_scrambleString(string_to_convert,scrambler_string)
% This function scrambles a string using the XOR hash method
% It goes letter by letter through the scrambler_string to convert, and for each
% letter, takes a letter out of the scrambler_string and XORs with that
% letter, cycling through the scrambler string beginning once it reaches
% the end. 
%
% To keep the letters readable, it unit shifts letters down by 32,
% and performs operations only up to 63 after the shift, thereby forcing
% the results to only occur in 6 bits maximum. It then shifts the results
% back up by 32, producing readable characters. One consequence of this
% readability is that only upper case letters can be used, and no letters
% higher than 96 on the ASCII table. The code checks for both cases.

% % Check ASCII tables
% character_numbers = 0:127;
% all_ASCII = char(character_numbers);
% valid_uppercase_flag = all_ASCII==upper(all_ASCII);
% 
% % Find where upper-case switches to lower-case. Note: need -1 since ASCII
% % chart starts with 0 indexing, but MATLAB starts at 1
% largest_valid_character = find(diff(valid_uppercase_flag)==-1,1) - 1;
% % This gives a largest valid character of 96. The lowest valid character
% % is the one right after the single quote 



% ASCII Table, readable form (after quote, which breaks strings), goes from
% 40 to 96
starting_ASCII = 40;
ending_ASCII = starting_ASCII+63; % Force the result to only use bottom 64 bits
ASCII_range = ending_ASCII - starting_ASCII + 1;

% Convert strings to numbers, and check them
numbers_to_convert = uint8(string_to_convert);

scrambler_numbers = uint8(upper(scrambler_string));

% Make sure these are well formed 
if any(numbers_to_convert<starting_ASCII)
    indices = numbers_to_convert<starting_ASCII;
    fprintf(1,'Bad numbers detected in hashing.\n')
    bad_numbers = numbers_to_convert(indices);
    for ith_bad_number = 1:length(bad_numbers)
        fprintf(1,'Bad number %.0d has ASCII value: %.0d, with character value: %s\n',ith_bad_number,bad_numbers(ith_bad_number),char(bad_numbers(ith_bad_number)));
    end
    error('Conversion string has characters that are not convertible because they are too low in ASCII table');
end
if any(scrambler_numbers<starting_ASCII)
    indices = scrambler_numbers<starting_ASCII;
    fprintf(1,'Bad scramblers detected in hashing.\n')
    bad_numbers = scrambler_numbers(indices);
    for ith_bad_number = 1:length(bad_numbers)
        fprintf(1,'Bad scrambler %.0d has ASCII value: %.0d, with character value: %s\n',ith_bad_number,bad_numbers(ith_bad_number),char(bad_numbers(ith_bad_number)));
    end
    error('Scrambler string has characters that are not convertible because they are too low in ASCII table');
end
if any(numbers_to_convert>ending_ASCII)
    indices = numbers_to_convert>ending_ASCII;
    fprintf(1,'Bad numbers detected in hashing.\n')
    bad_numbers = numbers_to_convert(indices);
    for ith_bad_number = 1:length(bad_numbers)
        fprintf(1,'Bad number %.0d has ASCII value: %.0d, with character value: %s\n',ith_bad_number,bad_numbers(ith_bad_number),char(bad_numbers(ith_bad_number)));
    end
    error('Conversion string has characters that are not convertible because they are too high in ASCII table');
end
if any(scrambler_numbers>ending_ASCII)
    indices = scrambler_numbers>ending_ASCII;
    fprintf(1,'Bad scramblers detected in hashing.\n')
    bad_numbers = scrambler_numbers(indices);
    for ith_bad_number = 1:length(bad_numbers)
        fprintf(1,'Bad scrambler %.0d has ASCII value: %.0d, with character value: %s\n',ith_bad_number,bad_numbers(ith_bad_number),char(bad_numbers(ith_bad_number)));
    end
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