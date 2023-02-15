% FCN_CODEX_09_TOTHETOPOFTHEMOUNTAIN - find odd numbers
%    
%    Welcome to FCN_CODEX_09_TOTHETOPOFTHEMOUNTAIN . This assignment is a
%    modification to the prior red-light/green-light code. The goal here is
%    to identify the point at which an output is no longer increasing. The
%    code will start by returning a signal. 
% 
%    climb_height =
%    fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number);
%  
%    This signal will increase, and then decrease at some point, and then
%    increase, and then decrease, etc. The goal is to identify the number
%    that is the most immediate highest, after it starts to decrease.
%    Because the "climb" may randomly start to increase again, it is
%    important to identify the number quickly - otherwise the answer will
%    change!
% 
%    [climb_height, answer] =
%    fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number,highest_peak);
% 
%    The answer variable will be returned as empty until the "highest_peak"
%    is correctly entered
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode and pass in the function name, student number, and answer.
% 
%    fcn_GradeCodeX('fcn_CodeX_09_ToTheTopOfTheMountain', answer, student_number);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
%