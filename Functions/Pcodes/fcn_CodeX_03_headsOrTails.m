% FCN_CODEX_03_HEADSORTAILS - find a number in a list
%    
%    Welcome to FCN_CODEX_03_HEADSORTAILS . In this assignment, you are
%    asked to determine, from a set of random numbers that are from 0 to 1,
%    if the number is heads (greater or equal to 0.5), or tails (less than
%    0.5). The random numbers are given as a long vector (50 elements). The
%    answer should also be a vector of same length, composed only of 0
%    (tails) or 1 (heads) corresponding to the associated random number in
%    the same row. For example, let's say we fill the random vector:
% 
%    random_vector = fcn_CodeX_03_headsOrTails(entry_key,student_number);
% 
%    and it produces the following: (only showing the first few entries)
% 
%    random_vector =
%  
%      0.5681
%      0.8691
%      0.4362
%      0.8021
%      0.1438 
%     (etc)
% 
%    Then the answers to this function would be:
% 
%    answer_03 =
%  
%      1
%      1
%      0
%      1
%      0 
%      (etc)
% 
%    This assignment is easiest completed by writing code, and specifically
%    your own function. In fact there is a way to solve for heads or tails
%    with only one line of code in the function.
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode. For example, to solve this, one could type in their
%    script or at the MATLAB prompt:
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 123; % <--- this must be changed                      
%             random_vector = fcn_CodeX_03_headsOrTails(entry_key,student_number);
%             answer_03 = fcn_CodeX_03_YOURFUNCTIONHERE(random_vector);
% 
%             fcn_GradeCodeX('fcn_CodeX_03_headsOrTails',student_number, answer_03);
% 
%    If the answer is right, the grader prints information and gives you the next
%    problem.
%