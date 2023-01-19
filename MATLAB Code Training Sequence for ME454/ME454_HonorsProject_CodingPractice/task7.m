function [isHigher] = task7(guess)
% This function teaches binary search by ensuring that students can use a
% more efficient method to find a password, assuming data is given about
% whether it is higher or lower

id = 102098;

rng(floor(id/4));

key  = floor(100000*rand());

if key > guess
    isHigher = 1;
elseif key < guess
    isHigher = 0;
elseif key == guess
    isHigher = 2;
end
end

