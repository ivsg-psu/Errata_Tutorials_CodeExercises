% FCN_CODEX_04_DOUBLEORNOTHING - find a number in a list
%    
%    Welcome to FCN_CODEX_04_DOUBLEORNOTHING . In this assignment, you are
%    asked to find, from a vector of 50 random numbers, the one number hidden in
%    the set that is EXACTLY twice as big as one of the other 49 numbers. The
%    correct answer is the row of the "double" number. For example, say we
%    call the function:
% 
%    random_vector = fcn_CodeX_04_doubleOrNothing(entry_key,student_number);
% 
%    and it produces the following: (only showing the first five entries)
% 
%    random_vector =
%  
%      0.5681
%      0.2876
%      0.4362
%      0.8021
%      0.1438 
%     
% 
%    One can observe that the 2nd row is twice the value of the 5th row.
%    Thus, the answers to this function would be 2, as the 2nd row is hiding
%    a number that is twice the value of another number.
% 
%    answer_04 = 2;
% 
%    This assignment is easiest completed by writing your own function. And
%    yes, there is a solution that solves this with only one line of code in
%    the function.
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode and pass in the function name, student number, and answer.
%  
%    For example, to solve this, one could type in their script or at the
%    MATLAB prompt:
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 123; % <--- this must be changed                      
%             random_vector = fcn_CodeX_04_doubleOrNothing(entry_key,student_number);
%             answer_04 = fcn_CodeX_04_YOURFUNCTIONHERE(random_vector);
% 
%    And then to grade the answer, one can call the grader function:
% 
%             fcn_GradeCodeX('fcn_CodeX_04_doubleOrNothing',student_number, answer_04);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
%