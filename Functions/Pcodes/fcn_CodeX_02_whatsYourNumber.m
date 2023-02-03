% FCN_CODEX_02_WHATSYOURNUMBER - find a number in a list
%    
%    Welcome to FCN_CODEX_02_WHATSYOURNUMBER . In this assignment, you are
%    asked to find a number - your student number - in a list produced by
%    this function and return the row where this is found. For example, 
%  
%    While one can do this manually, harder versions of the code that
%    folllow (soon) will require that this be done by writing code. To get
%    started, generate a random list by calling this function with your
%    student number.
% 
%    result_02_list = fcn_CodeX_02_whatsYourNumber(entry_key,student_number);
% 
%    In this list is hidden, in one of the rows, the student_number value.
%    The correct answer is to return the row number that matches the
%    student_number from the list.
% 
%    To check if the answer is correct, call fcn_GradeCode. 
%    For example, to solve this, one could type in their script or at the
%    MATLAB prompt:
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 123; % <--- this must be changed                      
%             result_02_list = fcn_CodeX_02_whatsYourNumber(entry_key,student_number);
% 
%             (write code or inspect the list here to find which row has the
%             answer)
% 
%             fcn_GradeCodeX('fcn_CodeX_02_whatsYourNumber',answer);
% 
%    If the answer is right, the grader prints information and gives you the next
%    problem.
%