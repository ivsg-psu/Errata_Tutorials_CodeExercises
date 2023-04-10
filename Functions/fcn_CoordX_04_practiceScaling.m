function [random_points, S] = fcn_CoordX_04_practiceScaling(varargin)
% FCN_COORDX_04_PRACTICESCALING - Find the index of the largest Y - value
% after scaling the points
%   
%   Welcome to FCN_COORDX_04_PRACTICESCALING. In this assignment, you are given
%   some set of random points and a scaling parameter (S value). The
%   user is supposed to scale the random points using given S and
%   find the index of the maximum Y - value after scaling the points.
%   
%   The answer to this excercise is the row_index of the scaled point with
%   the largest Y - value
%
%   [random_points, theta] =
%   fcn_CoordX_04_practiceScaling(entry_key,student_number); 
%   
%   How to scale the points? 
%   
%   transformation_matrix = eye(3)

%   transformation_matrix(1,1) = S;
%   transformation_matrix(2,2) = S;
%
%   For scaling the points, use --
%   (transformation_matrix*homogenous_random_points')'
%   
%   " ' "  --  Transpose of a matrix
%
%   Homogenous points: Z - co-ordinates of the randomly generated points
%   should be '1'
%
%   To check if the answer is correct, call fcn_GradeCodeX. 
%   For example, to solve this, one could type in their script or at the
%   MATLAB prompt:
% 
%            entry_key = ' 234ADH&45'; % <--- this must be changed
%            student_number = 1234; % <--- this must be changed                      
%            row_index = fcn_CoordX_04_practiceScaling(entry_key,student_number);
%
%            (write code or inspect the list here to find which row has the
%            answer)
%            
%            answer_04_largestYPoint_Index = row_index
%            fcn_GradeCodeX('fcn_CoordX_04_practiceScaling',answer_04_largestYPoint_Index);
%
%
%   Or, to skip entry of the student number, the student number can be
%   entered via code before calling the grading function:
%
%            student_number = 1234; % <--- this must be changed                      
%            fcn_GradeCodeX('fcn_CoordX_04_practiceScaling',answer_04_largestYPoint_Index, student_number);
%
%   If the answer is right, the grader prints information and gives you the next
%   problem. 

%   What does this code do? 
%
%   FORMAT:
%
%        [random_points, S] = fcn_CoordX_04_practiceScaling(entry_key,student_number);
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
%        random_points: a vector of randomly normal generated numbers
%
%        S: scaling parameter to scale the random points
%        
%
%   DEPENDENCIES:
%
%        fcn_DebugTools_checkInputsToFunctions
%        fcn_CodeX_generateNumbersLike
%
%   EXAMPLES:
%
%       See the script: script_demo_CoordX.m
%
%   This function was written on 2023_04_06 by S. Brennan Questions or
%   comments? sbrennan@psu.edu

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
dependencies = 'fcn_CoordX_03_practiceRegression, fcn_CoordX_04_practiceScaling';
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
this_fname = 'fcn_CoordX_04_practiceScaling';

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

%% Step 1 - Generate Random Points and Scaling parameter

rng(student_number);

Npoints = 100; % No. of Points

random_points = randn(Npoints,2);  % N Random Points are generated

S = randn(1,1)*student_number;

%% Step 2 - grade student answer
% Do we enter grading mode?
if nargin==nargin_lock_number
   
    % Calculate the lock value so that Grader can check entry value
    date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname);

    % Grader entered the correct value?
    if strcmp(Grader_input_code,date_lock_value)
        % Grader is correct - return requested information
        % 1) Return the correct answer   

        T = eye(3);

        %Transformation Matrix
        T(1,1) = S;
        T(2,2) = S;
        
        homogenous_random_points = [random_points ones(Npoints,1)];

        moved_points = (T*homogenous_random_points')';

        %max_y_after_scaling = max(moved_points(:,2));
        [~,max_y_Index_after_scaling] = max(moved_points(:,2));

        correct_answer = max_y_Index_after_scaling;
        temp{1} = correct_answer; 
        
        % 2) Grade the students answer
        student_answer = varargin{3};
        if(isequal(correct_answer,student_answer))
            temp{2} = true;
        else
            temp{2} = false;
        end
        
        % 3) Identify the function dependencies - NOTE: a function must
        % always be self-dependent!
        temp{3} = dependencies; % 
        %rotation_vector = temp;                                                      
             
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
%     fprintf(1,'Scrambled input: %s\n',output_result); 
%     second_scrambled_string = fcn_INTERNAL_scrambleString(output_result,scrambler_string);            %Ask Dr. B
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

%% fcn_INTERNAL_calculateDateLockValue
function date_lock_value = fcn_INTERNAL_calculateDateLockValue(this_fname)
which_result = which(this_fname);
if isempty(which_result)
    error('Unable to find self file - quitting.');
end
file_listing = dir(which_result);
date_lock_value = file_listing(1).date;
end % Ends fcn_INTERNAL_calculateDateLockValue

