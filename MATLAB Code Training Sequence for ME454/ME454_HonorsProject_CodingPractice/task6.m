function [binary] = task6()
% This function outputs a random binary number based on a student's id
id = 102048;

rng(id);

binary = 0;
for digit = 0:15
    if rand > 0.5
        binary = binary + 10.^digit;
    end
end
end

