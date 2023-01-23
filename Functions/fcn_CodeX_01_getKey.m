function scrambled_key = fcn_CodeX_01_getKey(varargin)
% In this assignment, you are asked to write code that queries this
% function, fcn_CodeX_01_getKey, with no arguments or inputs. The solution
% is literally one line of code that requests a code key (a strange set of
% characters) from the function. For example, to query a function called
% "fcn_be_happy" that fills a variable "a" with the result, you would type
% in their script or at the MATLAB prompt:
%
%                    a = fcn_be_happy;
%
% You will need to modify and run the above line of code for this function.
% And yes, it is stupidly easy. If you think you are correct, then check
% the value you get. For example, if you stored the result as "a" like in
% the example above, you would call:
%
% right_or_wrong = fcn_GradeCodeX(a);
%
% If you are right, the grader prints information and gives you the next
% problem. If you are wrong, it gives a red text that says you are wrong
% and perhaps a hint to help you. May this message be enough to get you
% started on your code journey - the first step is always the hardest!

% What this code does?
% Finds computer information, and uses it to form a key sequence. This key
% sequence is used in later problems to encrypt results and to ensure
% results for each student are done on different computers with different
% logins. The key has 7 fields:
% 1: MATLAB license number
% 2: MAC Address
% 3: The computer hostname on the network
% 4: The computer's name
% 5: The MATLAB version
% 6: The operating system and MATLAB type (student or full version?)
% 7: The user's login name
% These are then encrypted using a fixed, rotating hash unique to the
% computer.
%
% FORMAT:
%
%      scrambled_key = fcn_CodeX_01_getKey(varargin)
%
% INPUTS:
%
%      (none)
%
% OUTPUTS:
%
%      scrambled_key: a key containing the above fields
%
% DEPENDENCIES:
%
%      fcn_DebugTools_checkInputsToFunctions
%
% EXAMPLES:
%
%     See the script: script_demo_CodeX.m
%
% This function was written on 2023_01_23 by S. Brennan
% Questions or comments? sbrennan@psu.edu
