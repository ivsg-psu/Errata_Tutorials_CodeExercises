Npoints = 100;
random_points = randn(Npoints,2);
homogenous_random_points = [random_points ones(Npoints,1)];

% Define the transform matrix
tx = randn(1,1);
ty = randn(1,1);
T = [1 0 tx; 0 1 ty; 0 0 1];

moved_points = (T*homogenous_random_points')';

figure(1234);
clf;
hold on;
grid on;
axis equal;

plot(random_points(:,1),random_points(:,2),'b.', 'MarkerSize',10);
plot(moved_points(:,1),moved_points(:,2),'ro', 'MarkerSize',10);

% Find points closest to origin
dist_squared_to_origin = sum(moved_points.^2,2);
[~,closest_point_index] = min(dist_squared_to_origin);

plot(moved_points(closest_point_index,1),moved_points(closest_point_index,2),'g.', 'MarkerSize',30);
