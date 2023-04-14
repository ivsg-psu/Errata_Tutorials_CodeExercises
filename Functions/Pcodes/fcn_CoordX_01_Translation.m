%  FCN_COORDX_01_TRANSLATION - Find the closest point to the origin after
%  the transformation
%    
%    Welcome to FCN_COORDX_01_TRANSLATION. In this assignment, you are given
%    some set of random points and a translation_vector. The user is
%    supposed to translate the random points using the translation vector
%    and find the closest point to the orgin after translating the points.
% 
%    The answer to this excercise is the row_index of the closest point to
%    the origin after the translation has applied.
%    
% 
%    [random_points, translation_vector] =
%    fcn_CoordX_01_Translation(entry_key,student_number);
%    
%    How to translate the points? 
%    
%    You have to create the transformation matrix.
%     
%    (tx, ty) = translation_vector
% 
%    transformation_matrix = [1 0 tx; 0 1 ty; 0 0 1]
% 
%    For translating the points, 
%    use -- (transformation_matrix*homogenous_random_points')'
%    
%    " ' "  --  Transpose of a matrix
%    Homogenous points: Z - co-ordinates of the randomly generated points
%    should be '1'
% 
%    To check if the answer is correct, call fcn_GradeCodeX. 
%    For example, to solve this, one could type in their script or at the
%    MATLAB prompt:
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 1234; % <--- this must be changed 
%             row_index =
%             fcn_CoordX_01_Translation(entry_key,student_number);
% 
%             (write code or inspect the list here to find which row has the
%             answer)
%             
%             answer_01_closestPoint_Index = row_index;
% 
%             fcn_GradeCodeX('fcn_CoordX_01_Translation',answer_01_closestPoint_Index);
% 
% 
%    Or, to skip entry of the student number, the student number can be
%    entered via code before calling the grading function:
% 
%             student_number = 1234; % <--- this must be changed
%             fcn_GradeCodeX('fcn_CoordX_01_Translation',answer_01_closestPoint_Index,
%             student_number);
% 
%    If the answer is right, the grader prints information and gives you the next
%    problem.
%