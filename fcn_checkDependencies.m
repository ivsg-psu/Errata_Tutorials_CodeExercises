function fcn_checkDependencies(dependency_name, dependency_subfolders, dependency_url)
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
        
    % Do the subfolders exist?
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