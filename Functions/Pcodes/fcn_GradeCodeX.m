% FCN_GRADECODEX     grades problems for the CodeX challenges. 
%    
%    FCN_GRADECODEX with no input arguments automatically
%    builds a Utilities directory by downloading problems from the internet.
%    It also sets up the work environment, including resetting all solved
%    problems to "unsolved". It also asks the user, via a prompt, to enter
%    their student number.
% 
%    FCN_GRADECODEX(STUDENT_NUMBER) performs the same behavior as no inputs,
%    except without asking users to enter their student ID via
%    a prompt; the value in STUDENT_NUMBER is used instead. This enables
%    scripts to automatically start the code, for example:
% 
%    student_number = 1234; % Students would enter their number here
%    fcn_GradeCodeX(student_number); % Initialize with this number
% 
%    [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%    FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK) will query a function
%    given by a string in FUNCTION_NAME, checking to see if ANSWER_TO_CHECK
%    is the correct answer. If the answer is correct, then RIGHT_OR_WRONG is
%    set to true, and NEXT_FUNCTIONS lists a cell array of strings of the
%    next problems that can be done. Another cell array, NEXT_KEYS, lists
%    the "entry keys" for each of the next problems, listed in the same
%    ordering as NEXT_FUNCTIONS.
% 
%    If the answer is wrong, RIGHT_OR_WRONG is set to false and the cell
%    arrays are empty.
% 
%    [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%    FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK,STUDENT_NUMBER) does the
%    same as the previous call, but automatically uses the given student
%    number to avoid asking the user for this as an input.
% 
%    FORMAT:
% 
%         [RIGHT_OR_WRONG, NEXT_FUNCTIONS, NEXT_KEYS] = ...
%            FCN_GRADECODEX(FUNCTION_NAME,ANSWER_TO_CHECK,STUDENT_NUMBER)
% 
%    INPUTS:
% 
%         FUNCTION_NAME: A character array for the title of the functions to
%         be solved. 
% 
%         ANSWER_TO_CHECK: The student's answer to check.
% 
%    OUTPUTS:
% 
%         RIGHT_OR_WRONG: a true or false value, true if correct
% 
%         NEXT_FUNCTIONS: a cell array of filenames that can be opened with
%         the given keys.
% 
%         NEXT_KEYS: the keys for each of the filenames.
% 
%    DEPENDENCIES:
% 
%         This code will automatically get dependent files from the internet,
%         which requires an internet connection during the first instance
%         that it is run. Note: an internet connection is not needed after
%         the first run.
% 
%    EXAMPLES:
% 
%        See the script: script_demo_CodeX.m to get started.  To get
%        started, just call the function, fcn_GradeCodeX, with no arguments.
% 
%    This function was written on 2023_01_23 by S. Brennan
%    Questions or comments? sbrennan@psu.edu
%