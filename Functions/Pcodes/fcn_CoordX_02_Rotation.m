%  FCN_COORDX_02_ROTATION - Find the index of the largest X - value
%  after rotation
%    
%    Welcome to FCN_COORDX_02_ROTATION. In this assignment, you are given
%    some set of random points and an angle (theta value) in degrees. The
%    user is supposed to rotate the random points using given theta and
%    find the index of the maximum X - value after rotating the points.
%    
%    The answer to this excercise is the row_index of the rotated point with
%    the largest X - value
% 
%    [random_points, theta] =
%    fcn_CoordX_02_Rotation(entry_key,student_number); 
%    
%    How to rotate the points? 
%    
%    transformation_matrix = eye(3)
% 
%    transformation_matrix(1,1) = cos(theta); 
%    transformation_matrix(1,2) = -sin(theta); 
%    transformation_matrix(2,1) = sin(theta);
%    transformation_matrix(2,2)= cos(theta);
% 
%    For rotating the points, use --
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
%             row_index = fcn_CoordX_02_Rotation(entry_key,student_number);
% 
%             (write code or inspect the list here to find which row has the
%             answer)
%             
%             answer_02_largestXPoint_Index = row_index
%             fcn_GradeCodeX('fcn_CoordX_02_Rotation',answer_02_largestXPoint_Index);
% 
% 
%    Or, to skip entry of the student number, the student number can be
%    entered via code before calling the grading function:
% 
%             student_number = 1234; % <--- this must be changed                      
%             fcn_GradeCoordX('fcn_CoordX_02_Rotation',answer_02_largestXPoint_Index, student_number);
% 
%    If the answer is right, the grader prints information and gives you the next
%    problem.
%