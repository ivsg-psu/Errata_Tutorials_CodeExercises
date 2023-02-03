% FCN_CODEX_GENERATENUMBERSLIKE - create numbers that look like a seed
% number
%    
%    LIKE_NUMBERS = FCN_CODEX_GENERATENUMBERSLIKE(SEED_NUMBER,N) takes a
%    positive input integer, SEED_NUMBER, and generates N additional numbers
%    that look like the input, and outputs them as an array with N rows
%    called LIKE_NUMBERS. A "like number" is one whose size and choice of
%    digits is similar to the seed, so that it is difficult to immediately
%    spot the seed number. For example:
% 
%      seed_number = 123;
%      N = 5;
%      like_numbers = fcn_CodeX_generateNumbersLike(seed_number,N)
% 
%   Produces the following result:
%      
%      like_numbers =
%      
%         231
%         213
%         312
%         132
%         321
% 
%    FORMAT:
% 
%         LIKE_NUMBERS = FCN_CODEX_GENERATENUMBERSLIKE(SEED_NUMBER,N)
% 
%    INPUTS:
% 
%         SEED_NUMBER: an integer input
% 
%         N: the number of like numbers to generate
%        
%         (optional inputs) (none)
% 
%    OUTPUTS:
% 
%         LIKE_NUMBERS: an array with N rows of like numbers
% 
%    DEPENDENCIES:
% 
%         fcn_DebugTools_checkInputsToFunctions
% 
%    EXAMPLES:
% 
%        See the script: script_test_fcn_CodeX_generateNumbersLike
% 
%    This function was written on 2023_01_31 by S. Brennan Questions or
%    comments? sbrennan@psu.edu
%