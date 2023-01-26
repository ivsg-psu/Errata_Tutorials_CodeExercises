function fcn_GradeCodeX(varargin)
%FCN_GRADECODEX     grades problems for the CodeX challenges. 
%   
%   FCN_GRADECODEX with no input arguments with no inputs automatically
%   builds a Utilities directory by downloading problems from the internet.
%   It also sets up the work environment.
%
%   [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%   FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK) will query a function
%   given by a string in FUNCTION_NAME, checking to see if ANSWER_TO_CHECK
%   is the correct answer. If the answer is correct, then RIGHT_OR_WRONG is
%   set to true, and NEXT_FUNCTIONS lists a cell array of strings of the
%   next problems that can be done. Another cell array, NEXT_KEYS, lists
%   the "entry keys" for each of the next problems, listed in the same
%   ordering as NEXT_FUNCTIONS.
%
%   If the answer is wrong, RIGHT_OR_WRONG is set to false and the cell
%   arrays are empty.
%
%   FORMAT:
%
%        [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%           FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK)
%
%   INPUTS:
%
%        FUNCTION_NAME: A character array for the title of the functions to
%        be solved. 
%
%        ANSWER_TO_CHECK: The student's answer to check.
%
%   OUTPUTS:
%
%        RIGHT_OR_WRONG: a true or false value, true if correct
%
%        NEXT_FUNCTIONS: a cell array of filenames that can be opened with
%        the given keys.
%
%        NEXT_KEYS: the keys for each of the filenames.
%
%   DEPENDENCIES:
%
%        This code will automatically get dependent files from the internet,
%        which requires an internet connection during the first instance
%        that it is run. Note: an internet connection is not needed after
%        the first run.
%
%   EXAMPLES:
%
%       See the script: script_demo_CodeX.m to get started.  To get
%       started, just call the function, fcn_GradeCodeX, with no arguments.
%
%   This function was written on 2023_01_23 by S. Brennan
%   Questions or comments? sbrennan@psu.edu

% Revision history:
% 2023_01_23:
% -- wrote the code originally 
% 2023_01_26:
% -- improved header comments to match MATLAB style 

% TO DO
% -- Add input argument checking

global problem_number

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
    narginchk(0,7);    
end

if nargin==0
    problem_number = 0;
    flag_first_time = 1;
else
    flag_first_time = 0;
end

if nargin==1
    problem_number = 1;
    student_answer = varargin{1};
elseif nargin>1
    student_selected_problem_number = varargin{1}; %#ok<NASGU>
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
% Say what the library is called, and where to find the codes
library_name{1} = 'CodeX_Functions';
library_url{1} = 'https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises/blob/main/Functions/CodeX_Functions.zip?raw=true';

% Initialize file array
code_Names{1} = 'fcn_CodeX_01_getKey';
code_Names{2} = 'fcn_CodeX_02_whatsYourNumber';
code_Names{3} = 'fcn_CodeX_03_headsOrTails';
code_Names{4} = 'fcn_CodeX_04_doubleOrNothing';

nargin_lock_number = 42;

%% Do we need to set up the work space?
if 1==flag_first_time
    %% Dependencies and Setup of the Code
    % This code depends on several other libraries of codes that contain
    % commonly used functions. We check to see if these libraries are installed
    % into our "Utilities" folder, and if not, we install them and then set a
    % flag to not install them again.
    
    % Get the DebugTools
    dependency_name = 'DebugTools_v2023_01_18';
    dependency_subfolders = {'Functions','Data'};
    dependency_url = 'https://github.com/ivsg-psu/Errata_Tutorials_DebugTools/blob/main/Releases/DebugTools_v2023_01_18.zip?raw=true';
    fcn_INTERNAL_checkDependencies(dependency_name, dependency_subfolders, dependency_url)
    clear dependency_name dependency_subfolders dependency_url
    
    % Set dependencies for this project? Only need this in debugging mode
    if flag_do_debug
        if ~exist('flag_functionsAdded','var') || isempty(flag_functionsAdded)
            fcn_DebugTools_addSubdirectoriesToPath(pwd,{'Functions'});
            flag_functionsAdded = 1;
        end
    end
    
    disp('Done setting up environment. Adding library of problems.');
    
    % Set up CodeX library
    dependency_name = library_name{1};
    dependency_subfolders = {};
    dependency_url = library_url{1};
    fcn_INTERNAL_checkDependencies(dependency_name, dependency_subfolders, dependency_url);
    clear dependency_name dependency_subfolders dependency_url
    
    
    
    disp('Done setting up first problem. Nice job.');
    disp('Type: "help fcn_CodeX_01_getKey" to get started on the first problem!');
    
else % Each function self-grades!
    % Build a string command that will call the function
    function_name = code_Names{problem_number};
    grading_function_call = cat(2,'results = ',function_name,'(student_answer,');

    % Fill the inputs from 2 to end-1 with empty arguments - the last one
    % will be the lock value.
    for i=2:(nargin_lock_number-1)
        grading_function_call = cat(2,grading_function_call,' [],');
    end

    % Fill in the lock value to unlock the function
    lock_value = fcn_INTERNAL_calculateLockValue(function_name);
    grading_function_call = cat(2,grading_function_call,'''', lock_value,''');');
    
    
    % Run the code to get the correct answer
    if problem_number>0
        eval(grading_function_call);
        scrambler_hash = results{1}; %#ok<USENS>
        answer_right_wrong = results{2};
    end
    
    % Check that the student's input matches?
    if answer_right_wrong
        problem_number = problem_number + 1;
        fprintf(1,'Well done! Problem %.0d is now ready for you.\n',problem_number);
        
        
        fprintf(1,'Type: "help %s" to get started on the next problem.\n',code_Names{problem_number});
    else
        disp('Unfortunately, your answer was wrong. Try again!');
    end
    
    % Get results
    second_scrambled_string = fcn_INTERNAL_scrambleString(student_answer,scrambler_hash); %#ok<NASGU>
    %fprintf(1,'Decoded answers: %s\n',second_scrambled_string);
    
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
    
    % Nothing to do!
    


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

%% fcn_INTERNAL_calculateLockValue
function lock_value = fcn_INTERNAL_calculateLockValue(this_fname)
which_result = which(this_fname);
if isempty(which_result)
    error('Unable to find self file - quitting.');
end
file_listing = dir(which_result);
lock_value = sprintf('%.0f',file_listing(1).datenum);
end % Ends fcn_INTERNAL_calculateLockValue


function fcn_INTERNAL_checkDependencies(dependency_name, dependency_subfolders, dependency_url)
% The code requires several other libraries to work, namely the following
% 
% * DebugTools - the repo can be found at: https://github.com/ivsg-psu/Errata_Tutorials_DebugTools
% 
% Each should be installed in a folder called "Utilities" under the root
% folder. This means you need to create a folder called
%    ./Utilities/DebugTools/ 
% If you wish to put these codes in different directories, the function
% below can be easily modified with strings specifying the different
% location.
% 
% For ease of transfer, zip files of the directories used - without the
% .git repo information, to keep them small - are included in this repo.
% 
% The following code checks to see if the folders flag has been
% initialized, and if not, it checks to see if the directory "Utilities"
% exists, and if not, it creates it. It then checks if "DebugTools" exists,
% and if not, creates it. It then unzips the DebugTools zip file into the
% directory, which puts all the files in the DebugTools code set into this
% directory.
%
% Once the directory and files are ready, it calls the DebugTools function
% that loads the "path" information for MATLAB, namely: where can MATLAB
% find the files in these folders?

% Is the flag set that says that the folders are initialized? Check this
% using a command "exist", which takes a character string (the name inside
% the '' marks, and a type string - in this case 'var') and checks if a
% variable ('var') exists in matlab that has the same name as the string.
% The ~ in front of exist says to do the opposite. So the following command
% basically means: if the variable named 'flag_CodeX_Folders_Initialized'
% does NOT exist in the workspace, run the code in the if statement. If we
% look at the bottom of the if statement, we fill in that variable. That
% way, the next time the code is run - assuming the if statement ran to the
% end - this section of code will NOT be run twice.

% Create a variable name for our flag. Stylistically, global variables are
% usually all caps.
flag_varname = upper(cat(2,'flag_',dependency_name,'_Folders_Initialized'));

% Make the variable global
eval(sprintf('global %s',flag_varname));

if ~exist(flag_varname,'var') || isempty(eval(flag_varname))
    % Save the root directory, so we can get back to it after some of the
    % operations below. We use the Print Working Directory command (pwd) to
    % do this. Note: this command is from Unix/Linux world, but is so
    % useful that MATLAB made their own!
    root_directory_name = pwd;
    
    % Does the directory "Utilities" exist?
    utilities_folder_name = fullfile(root_directory_name,'Utilities');
    if ~exist(utilities_folder_name,'dir')
        % If we are in here, the directory does not exist. So create it
        % using mkdir
        [success_flag,error_message,message_ID] = mkdir(root_directory_name,'Utilities');
        
        % Did it work?
        if ~success_flag
            error('Unable to make the Utilities directory. Reason: %s with message ID: %s\n',error_message,message_ID);
        elseif ~isempty(error_message)
            warning('The Utilities directory was created, but with a warning: %s\n and message ID: %s\n(continuing)\n',error_message, message_ID);
        end
            
    end
    
    % Does the directory for the dependency folder exist?    
    dependency_folder_name = fullfile(root_directory_name,'Utilities',dependency_name);
    if ~exist(dependency_folder_name,'dir')
        % If we are in here, the directory does not exist. So create it
        % using mkdir
        [success_flag,error_message,message_ID] = mkdir(utilities_folder_name,dependency_name);
        
        % Did it work?
        if ~success_flag
            error('Unable to make the dependency directory: %s. Reason: %s with message ID: %s\n',dependency_name, error_message,message_ID);
        elseif ~isempty(error_message)
            warning('The %s directory was created, but with a warning: %s\n and message ID: %s\n(continuing)\n',dependency_name, error_message, message_ID);
        end
        
    end
        
    % Do the subfolders exist? If there are no subfolders, then we are
    % trying to do a file copy
    if isempty(dependency_subfolders)
        flag_allFoldersThere = 0;
    else
        % Check if folders already made?
        flag_allFoldersThere = 1;
        
        for ith_folder = 1:length(dependency_subfolders)
            subfolder_name = dependency_subfolders{ith_folder};
            
            % Create the entire path
            subfunction_folder = fullfile(root_directory_name, 'Utilities', dependency_name,subfolder_name);
            
            % Check if the folder and file exists that is typically created when
            % unzipping.
            if ~exist(subfunction_folder,'dir')
                flag_allFoldersThere = 0;
            end
        end
    end
    
    % Do we need to unzip the files?
    if flag_allFoldersThere==0
        % Files do not exist yet - try unzipping them. 
        save_file_name = tempname(root_directory_name);
        zip_file_name = websave(save_file_name,dependency_url);
        % CANT GET THIS TO WORK --> unzip(zip_file_url, debugTools_folder_name);
        
        % Is the file there?
        if ~exist(zip_file_name,'file')
            error('The zip file: %s for dependency: %s did not download correctly. This is usually because permissions are restricted on the current directory. Check the code install (see README.md) and try again.\n',zip_file_name, dependency_name);
        end
        
        % Try unzipping
        unzip(zip_file_name, dependency_folder_name);
        
        % Did this work?
        flag_allFoldersThere = 1;
        for ith_folder = 1:length(dependency_subfolders)
            subfolder_name = dependency_subfolders{ith_folder};
            
            % Create the entire path
            subfunction_folder = fullfile(root_directory_name, 'Utilities', dependency_name,subfolder_name);
            
            % Check if the folder and file exists that is typically created when
            % unzipping.
            if ~exist(subfunction_folder,'dir')
                flag_allFoldersThere = 0;
            end
        end
        if flag_allFoldersThere==0
            error('The necessary dependency: %s has an error in install, or error performing an unzip operation. Check the code install (see README.md) and try again.\n',dependency_name);
        else
            % Clean up the zip file
            delete(zip_file_name);
        end

    end
    
    % DebugTools is a special case because folders not added yet, and we
    % use DebugTools for the other directories
    if strcmp(dependency_name(1:10),'DebugTools')
        debugTools_function_folder = fullfile(root_directory_name, 'Utilities', dependency_name,'Functions');
        
        % Move into the folder, run the function, and move back
        cd(debugTools_function_folder);
        fcn_DebugTools_addSubdirectoriesToPath(dependency_folder_name,dependency_subfolders);
        cd(root_directory_name);
    else
       fcn_DebugTools_addSubdirectoriesToPath(dependency_folder_name,dependency_subfolders); 
    end

    
    % set a flag so we do not have to do this again
    eval(sprintf('%s = 1;',flag_varname));
end
end % Ends function fcn_checkDependencies



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

