function [password] = task1(id)
% This function generates a 5-digit password for the next task from a student
% created ID

rng(id);
password = floor(100000*rand());
end

