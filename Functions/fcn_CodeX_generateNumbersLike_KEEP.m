function like_numbers = fcn_CodeX_generateNumbersLike(seed_number,N, varargin) %#ok<FNDEF> 
%FCN_CODEX_GENERATENUMBERSLIKE - create numbers that look like a seed
%number
%   
%   LIKE_NUMBERS = FCN_CODEX_GENERATENUMBERSLIKE(SEED_NUMBER,N) takes a
%   positive input integer, SEED_NUMBER, and generates N additional numbers
%   that look like the input, and outputs them as an array with N rows
%   called LIKE_NUMBERS. A "like number" is one whose size and choice of
%   digits is similar to the seed, so that it is difficult to immediately
%   spot the seed number. For example:
%
%     seed_number = 123;
%     N = 5;
%     like_numbers = fcn_CodeX_generateNumbersLike(seed_number,N)
%
%  Produces the following result:
%     
%     like_numbers =
%     
%        231
%        213
%        312
%        132
%        321
%
%   FORMAT:
%
%        LIKE_NUMBERS = FCN_CODEX_GENERATENUMBERSLIKE(SEED_NUMBER,N)
%
%   INPUTS:
%
%        SEED_NUMBER: an integer input
%
%        N: the number of like numbers to generate
%       
%        (optional inputs) (none)
%
%   OUTPUTS:
%
%        LIKE_NUMBERS: an array with N rows of like numbers
%
%   DEPENDENCIES:
%
%        fcn_DebugTools_checkInputsToFunctions
%
%   EXAMPLES:
%
%       See the script: script_test_fcn_CodeX_generateNumbersLike
%
%   This function was written on 2023_01_31 by S. Brennan Questions or
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

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(2,2);  

    % Check seed_number input - positive integer, 1 column, 1 row
    fcn_DebugTools_checkInputsToFunctions(seed_number, 'positive_1column_of_integers',1);
    
    % Check N input - positive integer, 1 column, 1 row
    fcn_DebugTools_checkInputsToFunctions(N, 'positive_1column_of_integers',1);

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

flag_allowExtraDigits = 0; % Use a flag to specify whether more digits can be added
% For example, the seed is 1, and the user requests 50 different numbers.
% If the flag is 1, then we can generate numbers such as 6, 88, 42, 75,
% etc. because 2-digit numbers can give more unique range. If the flag is
% zero, then we generate 50 1-digit numbers.

rng(seed_number);

%% Step 1: find out how long the seed number is, in characters
seed_number_string = sprintf('%.0d',seed_number);
N_digits = length(seed_number_string);

% And how many are unique?
unique_characters = unique(seed_number_string);
N_unique = length(unique_characters);

%% Are there enough unique combinations with just the characters in the seed?
% If so, we can just use those, and quit!
if (factorial(N_unique)-1)>=N  % Make sure it is feasible
    % Note, the largest N_unique is 10 characters, and factorial 10 is roughly
    % 3.6 million. So this code can be VERY slow for large numbers.
    possible_permutations = unique(perms(seed_number_string),'rows');

    if length(possible_permutations(:,1))>N
        possible_numbers = str2num(possible_permutations); %#ok<ST2NM>

        % Keep any numbers that are NOT the seed_number
        all_like_numbers = possible_numbers(possible_numbers~=seed_number);

        % Randomize the results
        random_sort_order = randperm(length(all_like_numbers(:,1)));
        randomized_all_like_numbers = all_like_numbers(random_sort_order,:);
        like_numbers = randomized_all_like_numbers(1:N,1);
        return;
    end
end


%% Check to see if we need more digits than the seed has?

extra_digits = 0;
if flag_allowExtraDigits
    if (10^(N_digits-1)-1) < N
        % We need more digits - how many? The number of answers we can get,
        % using the same number of digits, is equal to 10^(number of digits -
        % 1). One of these is the seed number, so we have to subtract that
        % off. If N is larger than this, then we need to add more digits.
        while ((10^(N_digits-1+extra_digits)-1) < N)
            extra_digits = extra_digits+1;
        end
    end
end
N_digits_total = N_digits+extra_digits;

%% Check to see if we need more characters to use
% If the user gives an answer such as '666', then they only give us one
% character to permute through. Or if they give us '42' then we have 2
% characters. The number of permutations available to us is the factorial
% of the number of characters. And one of these will be used by the seed so
% we have to subtract 1. 

% Prep workspace
unused_number_characters = setdiff('0123456789',unique_characters);
N_unused = length(unused_number_characters);
random_sort_order = randperm(length(unused_number_characters));
random_unused_number_characters = unused_number_characters(random_sort_order);

% Start counting
num_permutations = 0;
iteration = 0;
characters_to_use = unique_characters;
while num_permutations < N
    iteration = iteration+1;

    % Did we run out of characters to add?
    character_index = mod(iteration,N_unused);
    if 0==character_index
        N_digits_total = N_digits_total+1;
        characters_to_use =  unique_characters;
    else
        characters_to_use = cat(2,characters_to_use,random_unused_number_characters(character_index));
    end

    % Calculate all the unique combos at this level. This includes all the
    % numbers that are replicates of 1 number (1111,2221, etc), replicates of
    % 2 numbers (1211, 2122, etc), ..., up to replicates of N_digits (1234)
    num_permutations = 0;
    permutations = {};
    % Iterate over digits
    for ith_combo = 1:N_digits_total 
        unique_combos = nchoosek(characters_to_use,ith_combo);
        % Iterate over unique combinations
        for ith_unique = 1:length(unique_combos(:,1))
            permutations_of_unique = perms(unique_combos(ith_unique,:));
            for ith_perm = 1:length(permutations_of_unique)
                permutations = [permutations; permutations_of_unique(ith_perm,:)]; %#ok<AGROW>
            end
        end
        num_permutations = length(permutations);
    end
    num_permutations = num_permutations-1; % Subtract off 1 due to seed_number


end

permutation_numbers = str2double(permutations);
permutation_numbers = permutation_numbers(permutation_numbers~=seed_number);

N_permutations = length(permutation_numbers);
random_sort_order = randperm(N_permutations);
random_permutation_numbers = permutation_numbers(random_sort_order);

%% Make sure they are unique, and long enough
if length(random_permutation_numbers(:,1))<N
    error('Need to fix the generalteNumbersLike code');
else
    like_numbers = random_permutation_numbers(1:N,1);
end


% 
% % % Pick some random characters to add
% % if N_extra_characters>0
% %     % Randomize the order of unused characters
% %
% %     all_characters = cat(2,unique_characters,random_unused_number_characters(1:N_extra_characters));
% % else
% %     all_characters = unique_characters;
% % end
% % N_characters_to_fill = length(all_characters);
% 
% %% Randomly fill using all_characters
% like_numbers = zeros(N,1);
% for ith_number = 1:(2*N)
%     random_character_indices = floor(N_characters_to_fill*rand(1,N_digits_total))+1;
%     number_string = all_characters(random_character_indices);
%     like_numbers(ith_number) = str2double(number_string);
% end
% 
% %% Make sure they are unique, and long enough
% like_numbers = like_numbers(like_numbers~=seed_number);
% if length(like_numbers(:,1))<N
%     error('Need to fix the generalteNumbersLike code');
% else
%     like_numbers = like_numbers(1:N,1);
% end



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
    
    % Nothing to do here

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


