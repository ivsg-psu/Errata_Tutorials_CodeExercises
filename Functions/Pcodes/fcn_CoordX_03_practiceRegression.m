%  FCN_COORDX_03_PRACTICEREGRESSION - Find the predicted values (y_pred) of
%  y using regression
%    
%    Welcome to FCN_COORDX_03_PRACTICEREGRESSION. In this assignment, you
%    are given x and y co-ordinates of N points. The y values are generated
%    from - y = mx + b + noise. The user needs to fit the noisy data using
%    regression techinques
%    
%    The answer to this excercise is the predicted values (y_pred) of noisy
%    data after fitting the data
% 
%    [x_data, y_noisy] =
%    fcn_CoordX_03_practiceRegression(entry_key,student_number); 
%    
%    How to fit the points? 
% 
%    The points can be fit using Least Squares Method. An example to fit
%    points in y = mx is shown below. 
%    
%    Let there be 100 random points, 
%    
%    Npoints = 100;
%    
%    random_points = randn(Npoints,2);
%    
%    x_data = random_points(:,1);
%    y_data = random_points(:,2);
% 
%    The user needs to find the slope (m) to fit these points. Generally, if
%    y and x values are known, m can be determined easily - m = y/x.
%    However, in this exercise, x and y are column vectors. Since it is not
%    straightforward to divide the vectors, the least squares method is used
%    in this case.
% 
%    Representing the column vectors in capital letters
%  
%    Y = Xm 
% 
%    X'Y = X'Xm 
%    
%    ((X'Y)(X'X)^-1) = m
%  
%    " ' "  --  Transpose of a matrix
%  
%    In MATLAB, if m = A\B (solves the linear system A*m = B (for m))
%  
%    Therefore to find m, use X'*X \ X'*Y. This is a better way to divide as
%    this method follows the row echelon method to find the "m".
%  
%    However, to fit y = mx + b
%    
%    use -- [x 1]*[m; b] = y
% 
%    To check if the answer is correct, call fcn_GradeCodeX.   
%    For example, to solve this, one could type in their script or at the
%    MATLAB prompt:
%  
%             entry_key = ' 234ADH&45'; % <--- this must be changed
%             student_number = 1234; % <--- this must be changed                      
%             row_index = fcn_CoordX_03_practiceRegression(entry_key,student_number);
% 
%             (write code or inspect the list here to find which row has the
%             answer)
%             
%             answer_03_yPred = y_pred
%             fcn_GradeCodeX('fcn_CoordX_03_practiceRegression',answer_03_yPred);
% 
% 
%    Or, to skip entry of the student number, the student number can be
%    entered via code before calling the grading function:
% 
%             student_number = 1234; % <--- this must be changed                      
%             fcn_GradeCodeX('fcn_CoordX_03_practiceRegression',answer_03_yPred, student_number);
% 
%    If the answer is right, the grader prints information and gives you the next
%    problem.
%