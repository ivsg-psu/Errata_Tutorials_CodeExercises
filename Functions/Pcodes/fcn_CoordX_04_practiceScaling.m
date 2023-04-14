%  FCN_COORDX_04_PRACTICESCALING - Find the index of the largest Y - value
%  after scaling the points
%    
%    Welcome to FCN_COORDX_04_PRACTICESCALING. In this assignment, you are given
%    some set of random points and a scaling parameter (S value). The
%    user is supposed to scale the random points using given S and
%    find the index of the maximum Y - value after scaling the points.
%    
%    The answer to this excercise is the row_index of the scaled point with
%    the largest Y - value
% 
%    [random_points, theta] =
%    fcn_CoordX_04_practiceScaling(entry_key,student_number); 
%    
%    How to scale the points? 
%    
%    transformation_matrix = eye(3)
% 
%    transformation_matrix(1,1) = S;
%    transformation_matrix(2,2) = S;
% 
%    For scaling the points, use --
%    (transformation_matrix*homogenous_random_points')'
%    
%    " ' "  --  Transpose of a matrix
% 
%    Homogenous points: Z - co-ordinates of the randomly generated points
%    should be '1'
% 
%    To check if the answer is correct, call fcn_GradeCodeX. 
%    For example, to solve this, one could type in their script or at the
%    MATLAB prompt:
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 1234; % <--- this must be changed                      
%             row_index = fcn_CoordX_04_practiceScaling(entry_key,student_number);
% 
%             (write code or inspect the list here to find which row has the
%             answer)
%             
%             answer_04_largestYPoint_Index = row_index
%             fcn_GradeCodeX('fcn_CoordX_04_practiceScaling',answer_04_largestYPoint_Index);
% 
% 
%    Or, to skip entry of the student number, the student number can be
%    entered via code before calling the grading function:
% 
%             student_number = 1234; % <--- this must be changed                      
%             fcn_GradeCodeX('fcn_CoordX_04_practiceScaling',answer_04_largestYPoint_Index, student_number);
% 
%    If the answer is right, the grader prints information and gives you the next
%    problem.
%