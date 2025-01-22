function name_hash = fcn_CodeX_calculateNameHash(student_number_string,string_2_hash) %#ok<FNDEF>
%% fcn_CodeX_calculateNameHash
% This is a helper function for the CodeX library that hashes strings. It
% it not a problem to be solved, but rather a function that is used often
% in many of the problems and so is kept as a stand-alone function.

%% Make sure the student number string is of char type
if ~ischar(student_number_string)
    if isstring(student_number_string)
        student_number_string = char(student_number_string);
    else
        error('Expecting student number to be string or character');
    end
end

%% Prep the hashing string by interlacing student number with MAC
mac_string = fcn_INTERNAL_getMACaddress;

% Find string lengths
length_number = length(student_number_string);
length_mac    = length(mac_string);

% Make sure both strings are same size
if length_number>length_mac
    full_number = student_number_string;

    
    
    % Make mac number longer

end

% Initialize interlaced string
interlaced = cat(2,mac_string,mac_string);
for ith_character = 1:length_mac
    interlaced(2*ith_character-1) = mac_string(ith_character);
    current_number_index = mod(ith_character-1,length_number)+1;
    interlaced(2*ith_character) = student_number_string(current_number_index);
end

% For debugging
% fprintf(1,'Interlaced: %s\n',interlaced);

name_hash = fcn_INTERNAL_scrambleString(string_2_hash,interlaced);
end % Ends fcn_CodeX_calculateNameHash


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


function scrambled_string = fcn_INTERNAL_scrambleString(string_to_convert,scrambler_string)
%% fcn_INTERNAL_scrambleString
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