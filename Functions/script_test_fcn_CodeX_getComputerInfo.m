% script_test_fcn_CodeX_getComputerInfo.m
% This is a script to exercise the function: fcn_CodeX_getComputerInfo_KEEP.m
% This function was written on 2025_01_27 by S. Brennan
% Questions or comments? sbrennan@psu.edu


% Revision history:
%      2025_01_27:
%      -- first write of the code

close all;
clc;


%% Basic case - numeric (adds a space)

MAC_address = fcn_CodeX_getComputerInfo_KEEP;

fprintf(1,'MAC Address: %s\n',MAC_address);


%% Fail conditions
if 1==0
    %% Bad input
    output_string = fcn_DebugTools_addStringToEnd(input_string,value_to_add);
end
    