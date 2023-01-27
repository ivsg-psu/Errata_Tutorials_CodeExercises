
%% Introduction to and Purpose of the Code
% This is the explanation of the CodeX that can be found by running
%
%       script_demo_CodeX.m
%
% This is a script that self-teaches students how to code via a set of
% challenges. 
%
% If you have questions or comments, please contact Sean Brennan at
% sbrennan@psu.edu
%
% The purpose of the code is to teach students to code, which -
% interestingly - is something that code is really good at!

%% We start by clearing the console - the part of the screen that we look at
% This is easily done in MATLAB by calling the "clc" command, where clc is
% shorthand for "clear console"

clc

% Other common "cleaning" commands include "clear all" which removes all variables
% from the workspace, and "close all" which closes all figures. So we'll
% often see codes that have, at the top: "clc, clear all, close all" as
% this makes the console, workspace variables, and plots all return to
% "startup" mode.


%% Problem 0 - setting up!
% Just call the function with no arguments to set up the next problem,
% problem 1!
fcn_GradeCodeX; 


%% Problem 1 - a blank function call
% Write code to call a function - fcn_CodeX_01_getKey. Note: you may have
% saved this file into a different name, which is fine.
result = fcn_CodeX_01_getKey;

% Standard grade it
fcn_GradeCodeX('fcn_CodeX_01_getKey', result);

% Deep grade it
% [correct_answer, right_or_wrong, next_functions] = ...
% fcn_GradeCodeX('fcn_CodeX_01_getKey', result);


%% Problem 2 - arguments in
% Write code to call a function - fcn_CodeX_01_getKey. Note: you may have
% saved this file into a different name, which is fine.
% result = fcn_CodeX_01_getKey;
% 
% % Grade it
% fcn_GradeCodeX(result)

%% Revision History:
%      2022_01_23:
%      -- created a demo script of core debug utilities, getting problems 0
%      to 1 to work
% This code repo is version controlled within the Intelligent Vehicles and
% Systems Group (IVSG) at: https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises