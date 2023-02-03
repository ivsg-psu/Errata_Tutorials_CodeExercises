% script_test_fcn_CodeX_generateNumbersLike.m
% This is a script to exercise the function: fcn_CodeX_generateNumbersLike.m
% This function was written on 2023_01_31 by S. Brennan
% Questions or comments? sbrennan@psu.edu


% Revision history:
%      2023_01_31:
%      -- first write of the code

close all;
clc;

%% Example case - 3 digits, only 5 results
seed_number = 123;
N = 5;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);



%% Basic case - 1 digit, only 1 result
seed_number = 1;
N = 1;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 1 digit, 5 results
seed_number = 6;
N = 5;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 1 digit, 15 results
seed_number = 6;
N = 15;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 1 digit, 100 results
seed_number = 6;
N = 100;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 2 digit, 1 results, in permutation list
seed_number = 61;
N = 1;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 2 digits, 5 results
seed_number = 61;
N = 5;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 2 digits, 15 results
seed_number = 61;
N = 15;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
assert(~isequal(like_numbers,1));
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 3 digits, within permutation limit
seed_number = 123;
N = 4;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 3 digits, 100 results
seed_number = 123;
N = 100;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Basic case - 9 digits, 10 results, in permutation list
seed_number = 123456789;
N = 10;
like_numbers = fcn_CodeX_generateNumbersLike_KEEP(seed_number,N);
fprintf(1,'\n\nGiven a seed of: %.0d\n',seed_number);
fprintf(1,'Produced the following like numbers:\n');
fprintf(1,'%.0d\n',like_numbers);

%% Fail conditions
if 1==0
    %% Bad input - wrong number of arguments
    fcn_CodeX_generateNumbersLike_KEEP(24);
    %% Bad input - wrong number of arguments
    fcn_CodeX_generateNumbersLike_KEEP(24,3,4);
    %% Bad input - not integer
    fcn_CodeX_generateNumbersLike_KEEP(2.34,5);
    %% Bad input - not positive
    fcn_CodeX_generateNumbersLike_KEEP(-2,5);
    %% Bad input - not integer
    fcn_CodeX_generateNumbersLike_KEEP(2,5.4);
    %% Bad input - not positive
    fcn_CodeX_generateNumbersLike_KEEP(2,-5.4)
end
    