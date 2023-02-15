% FCN_CODEX_05_WHATSTHEPASSWORD - find the integer password
%    
%    Welcome to FCN_CODEX_05_WHATSTHEPASSWORD . In this assignment,  the
%    function returns false for any integer "guess" (0 to 9) that is NOT equal to
%    the correct password. It returns true for the correct integer password.
%    The password is the answer to the problem.
% 
%    true_false = fcn_CodeX_05_whatsThePassword(entry_key,student_number,guess);,
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode and pass in the function name, student number, and answer.
%  
%    For example, if the correct password is 2, then the following would
%    produce a "true" result.
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 123; % <--- this must be changed   
%             guess = 2;
%             true_false = fcn_CodeX_05_whatsThePassword(entry_key,student_number,guess);
% 
%    And then to grade the answer, one can call the grader function:
% 
%             fcn_GradeCodeX('fcn_CodeX_05_whatsThePassword', answer, student_number);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
%