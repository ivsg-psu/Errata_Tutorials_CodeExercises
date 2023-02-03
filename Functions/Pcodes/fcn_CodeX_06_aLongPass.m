% FCN_CODEX_06_ALONGPASS - find the LONG integer password
%    
%    Welcome to FCN_CODEX_06_ALONGPASS . In this assignment, like a previous
%    one, the goal is to guess an integer password. But unlike the previous
%    case, now it could be a LONG password - up to 8 digits.
%  
%    Specifically: this function returns false for any integer "guess" that
%    is NOT equal to the correct password. It returns true for the correct
%    integer password. The password is the answer to the problem.
% 
%    true_false =
%    fcn_CodeX_06_aLongPass(entry_key,student_number,guess);,
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode and pass in the function name, student number, and answer.
%  
%    For example, if the correct password is 12345678, then the following would
%    produce a "true" result.
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 123; % <--- this must be changed   
%             guess = 12345678;
%             true_false = fcn_CodeX_06_aLongPass(entry_key,student_number,guess);
% 
%    And then to grade the answer, one can call the grader function:
% 
%             fcn_GradeCodeX('fcn_CodeX_06_aLongPass',student_number, guess);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
%