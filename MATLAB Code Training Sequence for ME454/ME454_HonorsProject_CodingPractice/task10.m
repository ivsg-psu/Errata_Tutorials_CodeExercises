function [parityBinary] = task10()
% This function outputs an array of 15 different 8-bit binary numbers with
% parity. The task is to determine which numbers have had bits that flipped
% and which have not, assuming even parity
id = 102098;
rng(id);

digits = rand(15, 8);
parityBinary = zeros(15, 1);
for i = 1:15
    paritySum = 0;
    for j = 1:8
        if digits(i, j) > 0.5
            parityBinary(i) = parityBinary(i) + 10.^j;
            paritySum = paritySum + 1;
        end
    end
    
    if mod(paritySum, 2) == 1 && rand() > 0.25
        parityBinary(i) = parityBinary(i) + 1;
    end
end
end

