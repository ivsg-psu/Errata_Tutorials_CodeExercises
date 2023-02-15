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
%    A goal of this exercise is to demonstrate the use of vectorized code,
%    namely codes that can operate on vectors and not just scalars. For
%    example, the operation: a = 2*b will give, for (b=5) a value for "a" (a
%    becomes 10). However, the operation will also work if b is a vector,
%    for example:
% 
%             b = [1; 2; 5];  % A column vector - semicolons separate rows
% 
%    Gives:
% 
%             a = [
%               2
%               4
%               10
%                 ]
% 
%    So this code, a = 2*b, is "vectorized" in that it works regardless if a
%    is a scalar or a vector (and matrices as well).
% 
%    The code in this function, FCN_CODEX_06_ALONGPASS, is also vectorized
%    such that one can pass in many guesses at once. So, if the "code
%    number" is 3, then the true_false output will also be a vector:
% 
%    guesses = [1; 2; 3; 7];
%    true_false =
%    fcn_CodeX_06_aLongPass(entry_key,student_number,guess);,  
% 
%    % The results, for this example, would give:
%    true_false = [0; 0; 1; 0];
% 
%    % So the answer, in this example is 3:
%    answer = 3;
%  
%    NOTE: it is VERY difficult to solve this problem without using
%    vectorized inputs, and processing the vectorized outputs. Nearly all
%    the advanced methods used in code seek to perform vectorized
%    operations, as these are many orders of magnitude faster than scalar
%    operations.
% 
%    Finally, to grade the answer, one can call the grader function:
% 
%             fcn_GradeCodeX('fcn_CodeX_06_aLongPass', answer, student_number);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
%