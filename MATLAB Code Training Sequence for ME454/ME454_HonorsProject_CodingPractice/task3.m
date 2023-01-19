function [password] = task3(lock)
% This function outputs a password when the correct number between 1 and 9
% is given to the function
id = 102098;

rng(floor(id*2));

key  = floor(100000*rand());

if key == lock
    password = floor(100000*rand());
else
    password = 'try again';
end
end

