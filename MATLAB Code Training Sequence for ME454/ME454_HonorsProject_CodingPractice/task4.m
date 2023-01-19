function [random] = task4()
% This function outputs a list of 15 random numbers. Students will have to
% determine if the numbers are even or odd

id = 102098;
rng(id*9);

random = rand(15, 1);
end

