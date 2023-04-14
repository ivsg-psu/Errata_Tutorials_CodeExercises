function [flag_answer_is_right, next_functions, next_keys] = fcn_GradeCoordX(varargin)
%FCN_GRADECOORDX     grades problems for the CoordX challenges. 
%   
%   FCN_GRADECOORDX with no input arguments automatically
%   builds a Utilities directory by downloading problems from the internet.
%   It also sets up the work environment, including resetting all solved
%   problems to "unsolved". It also asks the user, via a prompt, to enter
%   their student number.
%
%   FCN_GRADECOORDX(STUDENT_NUMBER) performs the same behavior as no inputs,
%   except without asking users to enter their student ID via
%   a prompt; the value in STUDENT_NUMBER is used instead. This enables
%   scripts to automatically start the code. For example, the following
%   code would cause this function to run without the student number being
%   requested at the command line:
%
%   student_number = 1234; % Students would enter their number here
%   fcn_GradeCodeX(student_number); % Initialize with this number
%
%   [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%   FCN_GRADECOORDX(FUNCTION_NAME,ANSWER_TO_CHECK) will query a function
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
%   [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%   FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK,STUDENT_NUMBER) does the
%   same as the previous call, but automatically uses the given student
%   number to avoid asking the user for this as an input.
%
%   FORMAT:
%
%        [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%           FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK,STUDENT_NUMBER)
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
% 2023_04_12:
% -- wrote the code originally 
% 2023_01_26:
% -- improved header comments to match MATLAB style 
% 2023_02_02:
% -- externalized hash function, functionalized dependencies check
% 2023_02_04:
% -- added improved error checking
% 2023_02_15:
% -- improved comments (in 06)
% 2023_03_28
% -- improved comments (flag_is_right)

% TO DO
% -- Add input argument checking

% % USE THIS TO CLEAR EVERYTHING
% 
% clear all
% clear global *
% delete code_Dependencies.mat


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
    narginchk(0,3);    
end

% First time entries always have 0 or 1 arguments
if nargin<2
    flag_first_time = 1;
else
    flag_first_time = 0;
end

% Initialize student_number
student_number = [];
if 1 == nargin  || (3 == nargin)
    temp = varargin{end};
    % Did the user give an positive integer?
    if isnumeric(temp) && (round(temp)==temp) && (temp>0) 
        student_number = temp;
    else
        error('Expecting student number, but input is not a positive integer.');
    end
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

ith_library = 1; 

library_name{ith_library}    = 'CoordX_2023_04_14';
library_folders{ith_library} = {};
library_url{ith_library}     = 'https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises/blob/main/Releases/CoordX_2023_04_14.zip';

ith_library = ith_library+1;
library_name{ith_library}    = 'AlignCoordinates_2023_03_29';
library_folders{ith_library} = {'Functions'};
library_url{ith_library}     = 'https://github.com/ivsg-psu/PathPlanning_GeomTools_AlignCoordinates/blob/main/Releases/AlignCoordinates_2023_03_29.zip?raw=true';


% Initialize file array
code_Names{1} = 'fcn_CoordX_01_Translation';
code_Names{2} = 'fcn_CoordX_02_Rotation';
code_Names{3} = 'fcn_CoordX_03_practiceRegression';
code_Names{4} = 'fcn_CoordX_04_practiceScaling';
code_Names{5} = 'fcn_CoordX_05_findScalingParameter';
code_Names{6} = 'fcn_CoordX_06_produce2DHomogeneousTranformMatrix';
code_Names{7} = 'fcn_CoordX_07_practiceKabschsAlgorithm';
code_Names{8} = 'fcn_CoordX_08_findHomogeneousTransformMatrix';
code_Names{9} = 'fcn_CoordX_09_findAffineTransformMatrix';





persistent solved_problems
% initialize all problems to unsolved (zero)
if isempty(solved_problems)
    solved_problems = zeros(length(code_Names),1);
end




%% Do we need to set up the work space?
if 1==flag_first_time
    fprintf(1,'Installing folders, getting codes ready ...\n');

    %% Dependencies and Setup of the Code
    % This code depends on several other libraries of codes that contain
    % commonly used functions. We check to see if these libraries are installed
    % into our "Utilities" folder, and if not, we install them and then set a
    % flag to not install them again.
    
    % Get the DebugTools
    DebugTools_dependency_name = 'DebugTools_v2023_01_29';
    DebugTools_dependency_subfolders = {'Functions','Data'};
    DebugTools_dependency_url = 'https://github.com/ivsg-psu/Errata_Tutorials_DebugTools/blob/main/Releases/DebugTools_v2023_01_29.zip?raw=true';
    fcn_INTERNAL_DebugTools_installDependencies(DebugTools_dependency_name, DebugTools_dependency_subfolders, DebugTools_dependency_url)

    clear DebugTools_dependency_name DebugTools_dependency_subfolders DebugTools_dependency_url
    
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
    dependency_subfolders = library_folders{1};
    dependency_url = library_url{1};

    fcn_INTERNAL_DebugTools_installDependencies(dependency_name, dependency_subfolders, dependency_url);
    clear dependency_name dependency_subfolders dependency_url
    
    
    
    disp('Done setting up folders.');
    
end

% Check if student number is empty
if isempty(student_number)
    temp = input('Enter your student number: ','s');
    number = str2double(temp);
    if isempty(temp) || ~isnumeric(number) || ~(round(number)==number) || ~(number>0)
        fprintf(1,'Bad input detected: %s\n',temp);
        error('Empty or bad student number detected. Student numbers must be positive integers.');
    else
        student_number = number;
    end
end

% Find the dependencies for each file
if ~exist('code_Dependencies','var')

    if exist('code_Dependencies.mat','file')
        load('code_Dependencies.mat','code_Dependencies'); 
    else
        code_Dependencies = fcn_INTERNAL_loadCodeDependencies(student_number,code_Names);
        save('code_Dependencies.mat','code_Dependencies');
    end
end

if 1==flag_first_time

    [next_functions, next_keys] = fcn_INTERNAL_printUnlockedCodes(student_number,'fcn_CodeX_01_getKey',code_Names,code_Dependencies,solved_problems);
    disp('Type: "help fcn_CodeX_01_getKey" to get started on the first problem!');

    
else % Each function self-grades!

    %% Find what problem we are working on

    % Grab student inputs
    function_name = varargin{1};
    student_answer = varargin{2};

    % Check if answer is right
    [~, flag_answer_is_right, ~] = fcn_INTERNAL_gradeProblemNumber(student_number, function_name, student_answer);
    
    % Check that the student's input matches?
    next_functions = [];
    next_keys = [];
    if flag_answer_is_right
        % It is right - remember that it is right
        problem_number = fcn_INTERNAL_findProblemNumber(code_Names, function_name);
        solved_problems(problem_number) = 1;

        % Print next options
        [next_functions, next_keys] = fcn_INTERNAL_printUnlockedCodes(student_number, function_name,code_Names,code_Dependencies,solved_problems);       
    else
        % It is wrong
        disp('Unfortunately, the answer was wrong. Try again!');
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

%% fcn_INTERNAL_loadCodeDependencies
function code_Dependencies = fcn_INTERNAL_loadCodeDependencies(student_number,code_Names)
fprintf(1,'Checking code dependencies ...\n');

% Initialize the variable
code_Dependencies{length(code_Names)} = [];

% Loop through each code - calling it to retrieve the dependencies (SLOW)
for ith_codeName = 1:length(code_Names)
    function_name = code_Names{ith_codeName};
    fprintf(1,'\t Checking: %s ',function_name);
    if exist(function_name, 'file')
        [~, ~, function_dependencies] = fcn_INTERNAL_gradeProblemNumber(student_number, function_name,[]);
        code_Dependencies{ith_codeName} = function_dependencies;
        fprintf(1,'\t <-- Success\n');
    else
        fprintf(1,'\t <-- Fail\n');        
        fprintf(1,'\t\t WARNING: Unable to find file: %s for dependencies... Attempting p-code regeneration.\n',function_name);
        try
            fcn_CodeX_generatePcodes;
            fprintf(1,'\t Checking (again): %s ',function_name);
        catch 
            fprintf(1,'\t\t WARNING: Tried p-code regeneration but it failed. Unable to access dependencies for file: %s\n',function_name);
        end
        if exist(function_name, 'file')
            [~, ~, function_dependencies] = fcn_INTERNAL_gradeProblemNumber(student_number, function_name,[]);
            code_Dependencies{ith_codeName} = function_dependencies;
            fprintf(1,'\t <-- Success\n');

        else
            fprintf(1,'\t <-- Fail\n');
            fprintf(1,'\t\t WARNING: Tried p-code regeneration was successful, but still unable to access dependencies for file: %s\n',function_name);            
            code_Dependencies{ith_codeName} = {};
        end
    end
end
fprintf(1,'Done checking code dependencies.\n');
end % Ends fcn_INTERNAL_loadCodeDependencies

%% fcn_INTERNAL_printUnlockedCodes
function [next_functions, next_keys] = fcn_INTERNAL_printUnlockedCodes(student_number, function_name,code_Names,code_Dependencies, solved_problems)

fprintf(1,'\nIf you are seeing this message, then the grader was called with correct inputs!\n');

N_chars = 40;

% Find the dependencies for each file, and check if they match the
% current function
next_functions = {};
next_keys = {};

% Print all the problems
flag_dependency_found = 0;
for ith_codeName = 1:length(code_Names)
    current_code = code_Names{ith_codeName};
    current_dependency = code_Dependencies{ith_codeName};
    if ~isempty(current_dependency)
        current_dependencies_cells = fcn_DebugTools_parseStringIntoCells(current_dependency);
    else
        current_dependencies_cells = {};
    end
    if any(strcmpi(function_name,current_dependencies_cells))
        % Print the header?
        if 0 == flag_dependency_found 
            fprintf(1,'The following functions, with corresponding entry_keys, are now unlocked for you.\n');
            fprintf(1,'Note: some entry keys can contain spaces. The keys are the entire string between the quotes.\n');
            
            % Print results to fixed width
            header_1_str = sprintf('%s','FUNCTION');
            fixed_header_1_str = fcn_DebugTools_debugPrintStringToNCharacters(header_1_str,N_chars);
            header_2_str = sprintf('%s','''ENTRY_KEY''');
            fixed_header_2_str = fcn_DebugTools_debugPrintStringToNCharacters(header_2_str,N_chars);
            fprintf(1,'\t\t%s \t %s\n',fixed_header_1_str,fixed_header_2_str);
        end    
        
        % Calculate the hash for this function
        flag_dependency_found = 1;
        student_number_string = sprintf('%.0d',student_number);
        current_name_hash = fcn_CodeX_calculateNameHash(student_number_string,upper(current_code));

        % Print results to fixed width
        header_1_str = sprintf('%s',current_code);
        fixed_header_1_str = fcn_DebugTools_debugPrintStringToNCharacters(header_1_str,N_chars);
        %  fprintf(1,'\t\t%s \t ''%s''\n',fixed_header_1_str,current_name_hash);
        % Colorized printing
        if solved_problems(ith_codeName)
            fcn_DebugTools_cprintf('Comments','\t\t%s \t ''%s''\n',fixed_header_1_str,current_name_hash);
        else
            fcn_DebugTools_cprintf('UnterminatedStrings','\t\t%s \t ''%s''\n',fixed_header_1_str,current_name_hash);
        end
        
        next_functions{end+1} = header_1_str; %#ok<AGROW> 
        next_keys{end+1} = current_name_hash; %#ok<AGROW> 
        
    end
end
if flag_dependency_found
    fprintf(1,'Type: "help (functionName)" to start solving any of these functions.\n');
else
    fprintf(1,'It appears that all the functions have been completed! Check back later for more.\n');
end

end % ends fcn_INTERNAL_printUnlockedCodes

%% fcn_INTERNAL_gradeProblemNumber
function [correct_answer, right_or_wrong, function_dependencies] = fcn_INTERNAL_gradeProblemNumber(student_number, function_name, student_answer)

if ~isempty(student_answer)
    fprintf(1,'Grading student_answer for problem: %s\n',function_name); % Forces the argument?
end

% Initialize the lock_number
nargin_lock_number = 42;

% Check the problem
% 1) Build the front end with the function hash
student_number_string = sprintf('%.0d',student_number);
function_name_hash = fcn_CodeX_calculateNameHash(student_number_string,upper(function_name));
grading_function_call = cat(2,'results = ',function_name,'(''',sprintf('%s',function_name_hash),''',');

% 2) Add the student_number as second argument
grading_function_call = cat(2,grading_function_call,'student_number,');

% 2) Add the student answer as third argument
if isempty(student_answer)
    grading_function_call = cat(2,grading_function_call,'[],');
else
    grading_function_call = cat(2,grading_function_call,'student_answer,');
end

% Fill the inputs from 4 to end-1 with empty arguments - the last one
% will be the lock value.
for i=4:(nargin_lock_number-1)
    grading_function_call = cat(2,grading_function_call,' [],');
end

% Fill in the date_lock value to unlock the function - this is the lock
% value for Grading
date_lock_value = fcn_INTERNAL_calculateDateLockValue(function_name);
grading_function_call = cat(2,grading_function_call,'''', date_lock_value,''');');


% Run the code to get the correct answer
try
    eval(grading_function_call);
catch
    fprintf(1,'\n\n Hitting an error when running the following command:\n');
    fprintf(1,'%s\n',grading_function_call);
    disp('Debug here');
end
try
    correct_answer = results{1}; %#ok<USENS>
    right_or_wrong = results{2};
    function_dependencies = results{3};
catch ME
    fprintf(1,'Error was: %s\n',ME.identifier);
    error('The results appear to have been entered incorrectly in a function. Please debug!');
end
end % ends fcn_INTERNAL_gradeProblemNumber


%% fcn_INTERNAL_findProblemNumber
function problem_number = fcn_INTERNAL_findProblemNumber(code_Names, function_name)
% Given a list of code_names and a function_name, finds the index matching
% the function name to the list, returning this as the current problem
% number

problem_number = find(strcmp(code_Names,function_name)==1,1);

end % Ends fcn_INTERNAL_findProblemNumber





%% fcn_INTERNAL_calculateDateLockValue
function date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname)
which_result = which(this_fname);
if isempty(which_result)
    error('Unable to find self file - quitting.');
end
file_listing = dir(which_result);
date_lock_value = file_listing(1).date;
end % Ends fcn_INTERNAL_calculateDateLockValue

function fcn_INTERNAL_DebugTools_installDependencies(dependency_name, dependency_subfolders, dependency_url, varargin)
%% FCN_DEBUGTOOLS_INSTALLDEPENDENCIES - MATLAB package installer from URL
%
% FCN_DEBUGTOOLS_INSTALLDEPENDENCIES installs code packages that are
% specified by a URL pointing to a zip file into a default local subfolder,
% "Utilities", under the root folder. It also adds either the package
% subfoder or any specified sub-subfolders to the MATLAB path.
%
% If the Utilities folder does not exist, it is created.
% 
% If the specified code package folder and all subfolders already exist,
% the package is not installed. Otherwise, the folders are created as
% needed, and the package is installed.
% 
% If one does not wish to put these codes in different directories, the
% function can be easily modified with strings specifying the
% desired install location.
% 
% For path creation, if the "DebugTools" package is being installed, the
% code installs the package, then shifts temporarily into the package to
% complete the path definitions for MATLAB. If the DebugTools is not
% already installed, an error is thrown as these tools are needed for the
% path creation.
% 
% Finally, the code sets a global flag to indicate that the folders are
% initialized so that, in this session, if the code is called again the
% folders will not be installed. This global flag can be overwritten by an
% optional flag input.
%
% FORMAT:
%
%      fcn_DebugTools_installDependencies(...
%           dependency_name, ...
%           dependency_subfolders, ...
%           dependency_url)
%
% INPUTS:
%
%      dependency_name: the name given to the subfolder in the Utilities
%      directory for the package install
%
%      dependency_subfolders: in addition to the package subfoder, a list
%      of any specified sub-subfolders to the MATLAB path. Leave blank to
%      add only the package subfolder to the path. See the example below.
%
%      dependency_url: the URL pointing to the code package.
%
%      (OPTIONAL INPUTS)
%      flag_force_creation: if any value other than zero, forces the
%      install to occur even if the global flag is set.
%
% OUTPUTS:
%
%      (none)
%
% DEPENDENCIES:
%
%      This code will automatically get dependent files from the internet,
%      but of course this requires an internet connection. If the
%      DebugTools are being installed, it does not require any other
%      functions. But for other packages, it uses the following from the
%      DebugTools library: fcn_DebugTools_addSubdirectoriesToPath
%
% EXAMPLES:
%
% % Define the name of subfolder to be created in "Utilities" subfolder
% dependency_name = 'DebugTools_v2023_01_18';
%
% % Define sub-subfolders that are in the code package that also need to be
% % added to the MATLAB path after install; the package install subfolder
% % is NOT added to path. OR: Leave empty ({}) to only add 
% % the subfolder path without any sub-subfolder path additions. 
% dependency_subfolders = {'Functions','Data'};
%
% % Define a universal resource locator (URL) pointing to the zip file to
% % install. For example, here is the zip file location to the Debugtools
% % package on GitHub:
% dependency_url = 'https://github.com/ivsg-psu/Errata_Tutorials_DebugTools/blob/main/Releases/DebugTools_v2023_01_18.zip?raw=true';
%
% % Call the function to do the install
% fcn_DebugTools_installDependencies(dependency_name, dependency_subfolders, dependency_url)
%
% This function was written on 2023_01_23 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% Revision history:
% 2023_01_23:
% -- wrote the code originally

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
    narginchk(3,4);
end

%% Set the global variable - need this for input checking
% Create a variable name for our flag. Stylistically, global variables are
% usually all caps.
flag_varname = upper(cat(2,'flag_',dependency_name,'_Folders_Initialized'));

% Make the variable global
eval(sprintf('global %s',flag_varname));

if nargin==4
    if varargin{1}
        eval(sprintf('clear global %s',flag_varname));
    end
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



if ~exist(flag_varname,'var') || isempty(eval(flag_varname))
    fprintf(1,'Attempting install of the sub-utility: %s\n',dependency_name);
    % Save the root directory, so we can get back to it after some of the
    % operations below. We use the Print Working Directory command (pwd) to
    % do this. Note: this command is from Unix/Linux world, but is so
    % useful that MATLAB made their own!
    root_directory_name = pwd;

    % Does the directory "Utilities" exist?
    utilities_folder_name = fullfile(root_directory_name,'Utilities');
    if ~exist(utilities_folder_name,'dir')
        fprintf(1,'Main Utility subfolder does not exist - attempting creation of this folder.\n');
        % If we are in here, the directory does not exist. So create it
        % using mkdir
        [success_flag,error_message,message_ID] = mkdir(root_directory_name,'Utilities');

        % Did it work?
        if ~success_flag
            error('Unable to make the Utilities directory. Reason: %s with message ID: %s\n',error_message,message_ID);
        elseif ~isempty(error_message)
            warning('The Utilities directory was created, but with a warning: %s\n and message ID: %s\n(continuing)\n',error_message, message_ID);
        else
            fprintf(1,'Main Utility subfolder was successfully created.\n');
        end
    else
        fprintf(1,'Main Utility subfolder already exists - skipping creation of this folder.\n');
    end

    % Does the directory for the dependency folder exist?
    dependency_folder_name = fullfile(root_directory_name,'Utilities',dependency_name);
    fprintf(1,'Attempting creation of the sub-utility folder for: %s\n',dependency_name);
    if ~exist(dependency_folder_name,'dir')

        % If we are in here, the directory does not exist. So create it
        % using mkdir
        [success_flag,error_message,message_ID] = mkdir(utilities_folder_name,dependency_name);

        % Did it work?
        if ~success_flag
            error('Unable to make the dependency directory: %s. Reason: %s with message ID: %s\n',dependency_name, error_message,message_ID);
        elseif ~isempty(error_message)
            warning('The %s directory was created, but with a warning: %s\n and message ID: %s\n(continuing)\n',dependency_name, error_message, message_ID);
        else
            fprintf(1,'Sub-utility folder was successfully created.\n');
        end
    else
        fprintf(1,'Sub-utility subfolder already exists - skipping creation of this folder.\n');
    end

    % Do the subfolders exist?
    flag_allFoldersThere = 1;
    if isempty(dependency_subfolders)
        flag_allFoldersThere = 0;
        fprintf(1,'It appears the sub-utility has no folder sub-dependencies. None are checked: %s\n',dependency_name);
    else
        fprintf(1,'It appears the sub-utility has sub-folders. Checking if subfolders are already there for: %s\n',dependency_name);

        for ith_folder = 1:length(dependency_subfolders)
            subfolder_name = dependency_subfolders{ith_folder};
            fprintf(1,'\t Checking: %s\n',subfolder_name);
            
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
    fprintf(1,'Checking if download process needed for for: %s\n',dependency_name);
    if flag_allFoldersThere==0
        fprintf(1,'A package download is needed for: %s\n',dependency_name);
        % Files do not exist yet - try unzipping them.
        save_file_name = tempname(root_directory_name);
        zip_file_name = websave(save_file_name,dependency_url);
  
        % Is the file there?
        if ~exist(zip_file_name,'file')
            error('The zip file: %s for dependency: %s did not download correctly. This is usually because permissions are restricted on the current directory. Check the code install (see README.md) and try again.\n',zip_file_name, dependency_name);
        else
            fprintf(1,'Download files found and copied locally for: %s\n',dependency_name);
        end

        % Try unzipping
        unzip(zip_file_name, dependency_folder_name);

        % Did this work?
        fprintf(1,'Checking that unzip worked for: %s\n',dependency_name);
        flag_allFoldersThere = 1;
        if ~isempty(dependency_subfolders)
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
        
        if flag_allFoldersThere==0
            error('The necessary dependency: %s has an error in install, or error performing an unzip operation. Check the code install (see README.md) and try again.\n',dependency_name);
        else
            % Clean up the zip file
            delete(zip_file_name);
            fprintf(1,'Installation complete: %s\n',dependency_name);
        end
    else
        fprintf(1,'No downloads seem to be needed for: %s\n',dependency_name);
    end


    % For path creation, if the "DebugTools" package is being installed, the
    % code installs the package, then shifts temporarily into the package to
    % complete the path definitions for MATLAB. If the DebugTools is not
    % already installed, an error is thrown as these tools are needed for the
    % path creation.
    %
    % In other words: DebugTools is a special case because folders not
    % added yet, and we use DebugTools for adding the other directories
    if strcmp(dependency_name(1:10),'DebugTools')
        fprintf(1,'Adding path for Debug tools via file commands. Version installed is: %s\n',dependency_name);

        debugTools_function_folder = fullfile(root_directory_name, 'Utilities', dependency_name,'Functions');

        % Move into the folder, run the function, and move back
        cd(debugTools_function_folder);
        fcn_DebugTools_addSubdirectoriesToPath(dependency_folder_name,dependency_subfolders);
        cd(root_directory_name);
    else
        try
            fprintf(1,'Adding path for package to MATLAB environment: %s\n',dependency_folder_name);
            fcn_DebugTools_addSubdirectoriesToPath(dependency_folder_name,dependency_subfolders);
        catch
            error('Package installer requires DebugTools package to be installed first. Please install that before installing this package');
        end
        fprintf(1,'Path successfully added for: %s\n',dependency_folder_name);
    end


    % Finally, the code sets a global flag to indicate that the folders are
    % initialized.  Check this using a command "exist", which takes a
    % character string (the name inside the '' marks, and a type string -
    % in this case 'var') and checks if a variable ('var') exists in matlab
    % that has the same name as the string. The ~ in front of exist says to
    % do the opposite. So the following command basically means: if the
    % variable named 'flag_CodeX_Folders_Initialized' does NOT exist in the
    % workspace, run the code in the if statement. If we look at the bottom
    % of the if statement, we fill in that variable. That way, the next
    % time the code is run - assuming the if statement ran to the end -
    % this section of code will NOT be run twice.
    fprintf(1,'Setting global flag so that install does not repeat for: %s\n\n',dependency_name);
    eval(sprintf('%s = 1;',flag_varname));
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

end % Ends function fcn_DebugTools_installDependencies




