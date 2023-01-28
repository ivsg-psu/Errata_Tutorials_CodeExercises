% script_test_fcn_CodeX_calculateNameHash.m
% This is a script to exercise the function: fcn_CodeX_calculateNameHash.m
% This function was written on 2023_01_28 by S. Brennan
% Questions or comments? sbrennan@psu.edu


% Revision history:
%      2023_01_28:
%      -- first write of the code

close all;
clc;



%% Basic case - numeric (adds a space)
student_number = '1234567890';
string_to_hash = upper('abc123');
hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,string_to_hash);
fprintf(1,'Hash that was produced: %s\n',hash_result);
inverse_hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,hash_result);
fprintf(1,'Inverse hash that was produced: %s\n',inverse_hash_result);
assert(strcmp(string_to_hash,inverse_hash_result));

%% Fail conditions
if 1==0
    %% Bad input
    output_string = fcn_DebugTools_addStringToEnd(input_string,value_to_add);
end
    