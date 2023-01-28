% script_test_fcn_CodeX_01_getKey.m
% This is a script to exercise the function: fcn_CodeX_01_getKey.m
% This function was written on 2023_01_28 by S. Brennan
% Questions or comments? sbrennan@psu.edu


% Revision history:
%      2023_01_28:
%      -- first write of the code

close all;
clc;



%% Basic case - numeric (adds a space)
student_number = 1234;
entry_code = '';
results = fcn_CodeX_02_whatsYourNumber_KEEP(' RVMY\&QIN* JD^UNB:]3ATAUSU@',student_number,[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'738915');

%% Fail conditions
if 1==0
    %% Bad input
    output_string = fcn_DebugTools_addStringToEnd(input_string,value_to_add);
end
    