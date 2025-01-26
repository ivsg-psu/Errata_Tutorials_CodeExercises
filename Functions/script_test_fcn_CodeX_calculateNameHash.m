% script_test_fcn_CodeX_calculateNameHash.m
% This is a script to exercise the function: fcn_CodeX_calculateNameHash_KEEP.m
% This function was written on 2023_01_28 by S. Brennan
% Questions or comments? sbrennan@psu.edu


% Revision history:
%      2023_01_28:
%      -- first write of the code
%      2025_01_24:
%      -- refined examples, more comments, better interlacing

close all;
clc;


%% Basic case - numeric (adds a space)
student_number_raw = '1234567890';
student_number = student_number_raw; % mlreportgen.utils.hash(student_number_raw);

string_to_hash = upper('abc123');
fprintf(1,'\nInput that was sent for hashing: %s\n',string_to_hash);
hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,string_to_hash);

fprintf(1,'Hash that was produced: %s\n',hash_result);

% Now show that the inverse hashing operation is just the same operation
% again. This is because the XOR operation, when called twice, gives the
% original result back.
inverse_hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,hash_result);
fprintf(1,'Inverse hash that was produced: %s\n',inverse_hash_result);
assert(strcmp(string_to_hash,inverse_hash_result));

%% Hard case - all characters
student_number_raw = '1234567890';
student_number = student_number_raw; % mlreportgen.utils.hash(student_number_raw);

string_to_hash = char(40:96);
fprintf(1,'\nInput that was sent for hashing: %s\n',string_to_hash);
hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,string_to_hash);
fprintf(1,'Hash that was produced: %s\n',hash_result);
inverse_hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,hash_result);
fprintf(1,'Inverse hash that was produced: %s\n',inverse_hash_result);
assert(strcmp(string_to_hash,inverse_hash_result));



%% Basic case - string input, not character input
student_number_raw = "1234567890";
student_number = student_number_raw; % mlreportgen.utils.hash(student_number_raw);

string_to_hash = upper('abc123');
fprintf(1,'\nInput that was sent for hashing: %s\n',string_to_hash);
hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,string_to_hash);

fprintf(1,'Hash that was produced: %s\n',hash_result);

% Now show that the inverse hashing operation is just the same operation
% again. This is because the XOR operation, when called twice, gives the
% original result back.
inverse_hash_result = fcn_CodeX_calculateNameHash_KEEP(student_number,hash_result);
fprintf(1,'Inverse hash that was produced: %s\n',inverse_hash_result);
assert(strcmp(string_to_hash,inverse_hash_result));



%% Fail conditions
if 1==0
    %% Bad input
    output_string = fcn_DebugTools_addStringToEnd(input_string,value_to_add);
end
    