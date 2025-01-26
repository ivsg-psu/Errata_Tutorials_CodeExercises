% script_test_fcn_CodeX_Grade.m
% This is a script to exercise the function: fcn_CodeX_Grade_KEEP.m
% This function was written on 2023_01_28 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% REVISIONS:
% 2025_01_21 - S. Brennan
% -- improved comments
% -- renamed function for clarity
% -- added (-1) input for resetting

clc

%% Clearing argument inputs
% Clears everything including past installs
fcn_CodeX_Grade_KEEP(-1); 

%% Zero argument inputs
% Just call the grading function with no arguments to set up the environment
fcn_CodeX_Grade_KEEP; 


%% Problem 0 - setting up, but with student number
% Just call the function with no arguments to set up the next problem,
% problem 1!
student_number = 1234; % <--- this must be changed
fcn_GradeCodeX(student_number); 

%% Problem 1 - a blank function call
% Write code to call a function - fcn_CodeX_01_getKey. Note: you may have
% saved this file into a different name, which is fine.

result_01 = fcn_CodeX_01_getKey(entry_key_01,student_number);

% cd Functions
% result_01 = fcn_CodeX_01_getKey_KEEP(entry_key,student_number);
% cd ..

% Standard grade it - no student number
% fcn_GradeCodeX('fcn_CodeX_01_getKey', result_01);

% Standard grade it - with student number
fcn_GradeCodeX('fcn_CodeX_01_getKey', result_01, student_number);

% FOR DEBUGGING:
% Deep grade it (only works on Dr B's laptop, student number 1234)
% results = fcn_CodeX_01_getKey_KEEP(entry_key_01,student_number,[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'29-Jan-2023 08:29:00');
