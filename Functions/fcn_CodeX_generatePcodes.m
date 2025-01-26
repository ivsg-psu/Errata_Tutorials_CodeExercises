function fcn_CodeX_generatePcodes(varargin)
%% fcn_CodeX_generatePcodes
% fcn_CodeX_generatePcodes creates pcode versions of all the
% files whose name ends in _KEEP, creating both the p-code version of the
% file and a help version of the file, by copying the top contents of the
% file into a function. Puts all the contents into a folder called Pcodes
% and as well copies to the Utilities directory for debugging.
%
% FORMAT:
%
%      fcn_CodeX_generatePcodes
%
% INPUTS:
%
%      (folder)
%
% OUTPUTS:
%
%      (none)
%
% DEPENDENCIES:
%
%      fcn_DebugTools_checkInputsToFunctions
%
% EXAMPLES:
%
%     See the script: script_demo_CodeX.m
%
% This function was written on 2023_01_24 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% Revision history:
% 2023_01_24:
% -- wrote the code originally 
% 2023_02_15:
% -- do directory check to allow this function to be called directly
% 2025_01_25:
% -- added test script

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

%% Step 0 - get everything ready to start
% Save the location of the core directory
core_directory = pwd;
CodeX_library_name = 'CodeX_2023_03_28';

% Define where we will put the pcode results
functions_directory = fullfile(core_directory,'Functions');
pcode_directory     = fullfile(core_directory,'Functions','Pcodes');
utilities_directory = fullfile(core_directory,'Utilities',CodeX_library_name);

% Does the Pcodes directory exist?
if ~exist(pcode_directory, 'dir')
    flag_make_directory = 1;
    
    % Define the parent directory, and make sure it exists
    parent_directory = fullfile(core_directory,'Functions');
    if ~exist(parent_directory,'dir')
        % Are we already in the functions subdirectory?
        temp_current_directory = pwd;
        temp_Pcode_directory = fullfile(temp_current_directory,'Pcodes'); 
        
        % If the current directory name ends in "Functions" and has a
        % subfolder "Pcodes", then it's the right place
        if strcmp(temp_current_directory(end-8:end),'Functions') && exist(temp_Pcode_directory, 'dir')
            core_directory = temp_current_directory(1:end-10);

            % Define where we will put the pcode results
            functions_directory = fullfile(core_directory,'Functions');
            pcode_directory = fullfile(core_directory,'Functions','Pcodes');
            utilities_directory = fullfile(core_directory,'Utilities',CodeX_library_name);
            flag_make_directory = 0; % Folders already exist - skip
        else
            error('Expecting a sub-directory "Functions" under root. Quitting!');
        end
    end

    % Create the pcodes folder?
    if flag_make_directory
        [successful_pcode_directory_creation,message_pcode_directory_creation,message_ID_pcode_directory_creation] = mkdir(parent_directory,'Pcodes');
        % Check that creation was successful, throw error if not!
        if ~successful_pcode_directory_creation
            error('Unable to make the Pcodes directory in the Functions folder. Reason: %s with message ID: %s\n',message_pcode_directory_creation,message_ID_pcode_directory_creation);
        end
    end
end

%% Step 1 - get a listing of all the files
file_list = dir(cat(2,functions_directory,filesep,'*_KEEP.m'));

if isempty(file_list)
    error('No files found that end with "_KEEP.m".');
end

%% Step 2 - for each file, extract the core name
for ith_file = 1:length(file_list)
    filename = file_list(ith_file).name;
    name_parts = regexp(filename,'_KEEP.m','split');
    core_name = name_parts{1};

    %% Step 3 - from the core name, create the help file
    full_name = fullfile(core_directory,'Functions',filename);
    tempfile_name = help2file(full_name);

    % Copy the temp file to final location
    [copy_success,copy_message, copy_messageID] = copyfile(tempfile_name,fullfile(pcode_directory,cat(2,core_name,'.m'))); 
    if ~copy_success
        error('Unable to copy the readme helper mfile to the Pcodes folder. Reason: %s with message ID: %s\n',copy_message,copy_messageID);
    end
    delete(tempfile_name);

    %% Step 4 - from the core name, create the pcode
    pcode(full_name);
    pcode_source_fname = cat(2,filename(1:end-2),'.p');
    pcode_destination_fname = cat(2,filename(1:end-7),'.p');

    % Move the pcode file to the pcode directory
    pcode_destination = fullfile(pcode_directory,pcode_destination_fname);
    [copy_success,copy_message, copy_messageID] = copyfile(pcode_source_fname,pcode_destination);
    if ~copy_success
        error('Unable to copy the pcode file to the Pcodes folder. Reason: %s with message ID: %s\n',copy_message,copy_messageID);
    end
    delete(pcode_source_fname);

end

%% Step 3 - copy from pcode diretory to utilities directory
% Does the Utilities directory exist?
if exist(utilities_directory, 'dir')
    % Copy the files
    pcode_source_fname = fullfile(pcode_directory,'*.*');
    [copy_success,copy_message, copy_messageID] = copyfile(pcode_source_fname,utilities_directory);
    if ~copy_success
        error('Unable to copy the pcode file to the Pcodes folder. Reason: %s with message ID: %s\n',copy_message,copy_messageID);
    end
else
    warning('Unable to find the utilities directory for pcodes. Be sure to copy manually.')
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

% See: https://www.mathworks.com/matlabcentral/answers/100178-how-do-i-include-help-with-my-p-files-from-matlab
function tempfile_name = help2file(fname)
% HELP2FILE  extract the help informations from a MATLAB file and save it separately
%   the help information will be saved with the same name but using an underscore as a prefix.
mhelp = help(fname);
tempfile_name = [tempname '.m'];
%
fid = fopen(tempfile_name,'w');
fwrite(fid,['%' strrep(mhelp,newline,sprintf('\n%%'))]);
fclose(fid);
end