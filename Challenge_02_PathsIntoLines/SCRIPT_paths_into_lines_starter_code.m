% script_test_fcn_pathtools_getUserInputPath
% This is a script to exercise the function:
% fcn_pathtools_getUserInputPath.m
% This function was written on 2020_10_15 by S. Brennan
% Questions or comments? sbrennan@psu.edu 

close all;

%% Fill in some lines
% This part uses a predefined function to get user input points. Suggest
% choosing no more than 4 or 5 points
fig_num = 1;
if (~exist('pathXY','var'))
    pathXY = fcn_pathtools_getUserInputPath(fig_num);
else
    figure(fig_num);
    clf;
    plot(pathXY(:,1),pathXY(:,2),'b-','Linewidth',3);
    hold on;
end
Npoints = length(pathXY);

%% Create a SXY type path and other useful variables
change_in_XY = diff(pathXY);
distance_between_points = sum(change_in_XY.^2).^0.5;
unit_vector_in_XY = change_in_XY./distance_between_points;

% Multiply vectors by rotation matrix of 90-degrees to get perpendiculars
unit_perpendicular_vectors = unit_vector_in_XY*[0 -1; 1 0]; 

% Loop through points to fill in more densely
N_points_fill = 100;
variance = 1;

% Start the loop
filled_pathXY = zeros(N_points_fill*Npoints,2);
for i_point = 1:(Npoints-1)
    startX = pathXY(i_point,1);
    startY = pathXY(i_point,2);
    endX   = pathXY(i_point+1,1);
    endY   = pathXY(i_point+1,2);
    
    fillX = linspace(startX,endX,N_points_fill)';
    fillY = linspace(startY,endY,N_points_fill)';
    
    noisyXY = [fillX fillY] + unit_perpendicular_vectors(i_point,:)*variance.*randn(N_points_fill,1);
    
    start_index = (i_point-1)*N_points_fill +1;
    end_index   = (i_point-1)*N_points_fill +N_points_fill;
    filled_pathXY(start_index:end_index,:) = noisyXY;
    
    % For debugging:
    % plot(filled_pathXY(:,1),filled_pathXY(:,2),'r.');
end

% Plot results
plot(filled_pathXY(:,1),filled_pathXY(:,2),'r.');






