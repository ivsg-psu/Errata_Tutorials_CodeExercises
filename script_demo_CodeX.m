
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
% fcn_GradeCodeX; 


%% Problem 0 - setting up, but with student number
% Just call the function with no arguments to set up the next problem,
% problem 1!
student_number = 1234; % <--- this must be changed
fcn_GradeCodeX(student_number); 

%% Problem 1 - a blank function call
% Write code to call a function - fcn_CodeX_01_getKey. Note: you may have
% saved this file into a different name, which is fine.

entry_key_01 = '>:Ve1T-9efB+b<9HY<`'; % <--- this must be changed for each student and computer
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


%% Problem 2 - arguments in
entry_key_02 = '>:Ve1T-9efB(bLT=fJ`UYI\IV;8H'; % <--- this must be changed for each student and computer
list = fcn_CodeX_02_whatsYourNumber(entry_key_02,student_number);

% Solve the problem
answer_02 = find(list==student_number,1);

% Grade it
fcn_GradeCodeX('fcn_CodeX_02_whatsYourNumber', answer_02, student_number);

%% Problem 3 - heads or tails
entry_key_03 = '>:Ve1T-9efB)bS9=6JVHX:[PH'; % <--- this must be changed for each student and computer
output_result = fcn_CodeX_03_headsOrTails(entry_key_03,student_number);

% Solve the problem
answer_03 = output_result>=0.5; 

% Grade it
fcn_GradeCodeX('fcn_CodeX_03_headsOrTails', answer_03, student_number);

%% Problem 4 - double or nothing
entry_key_04 = '>:Ve1T-9efB.b?SI0U<U^U]HSPS='; % <--- this must be changed for each student and computer
output_result = fcn_CodeX_04_doubleOrNothing(entry_key_04,student_number);

% Solve the problem
answer_04 = find(output_result == intersect(output_result,2*output_result)); 

%  Deep debugging
% results = fcn_CodeX_04_doubleOrNothing_KEEP('VR^MY\%QMN*&JW[AX]T]6]U@[X[U',student_number,answer_04, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 03:57:53');

% Grade it
fcn_GradeCodeX('fcn_CodeX_04_doubleOrNothing', answer_04, student_number);

%% Problem 5 - what's the password?
entry_key_05 = '>:Ve1T-9efB/bLT=fJMR)K3OHNRH6'; % <--- this must be changed for each student and computer
student_number = 1234; % <--- this must be changed
guesses = (0:9)';
output_result = fcn_CodeX_05_whatsThePassword(entry_key_05,student_number,guesses);

% Solve the problem
answer_05 = find(output_result == 1)-1; 

% FOR Deep debugging
% results = fcn_CodeX_05_whatsThePassword_KEEP('>:Ve1T-9efB/bLT=fJMR)K3OHNRH6',student_number,answer_05, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 13:04:27');

% Grade it
fcn_GradeCodeX('fcn_CodeX_05_whatsThePassword', answer_05, student_number);


%% Problem 6 - a long pass
entry_key_06 = '>:Ve1T-9efB,b:PS\>I;_H'; % <--- this must be changed for each student and computer
student_number = 1234; % <--- this must be changed
guesses = (0:99999999)';
output_result = fcn_CodeX_06_aLongPass(entry_key_06,student_number,guesses);

% Solve the problem
answer_06 = find(output_result == 1)-1; 

% FOR Deep debugging
% results = fcn_CodeX_06_aLongPass_KEEP('>:Ve1T-9efB/bLT=fJMR)K3OHNRH6',student_number,answer_05, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 13:04:27');

% Grade it
fcn_GradeCodeX('fcn_CodeX_06_aLongPass', answer_06, student_number);

%% Problem 7 - thats odd
entry_key_06 = '>:Ve1T-9efB,b:PS\>I;_H'; % <--- this must be changed for each student and computer
student_number = 1234; % <--- this must be changed
some_odd_numbers = fcn_CodeX_07_thatsOdd(entry_key_06,student_number);

% Solve the problem
answer_07 = mod(some_odd_numbers,2)==1;

% FOR Deep debugging
% results = fcn_CodeX_07_thatsOdd_KEEP('>:Ve1T-9efB/bLT=fJMR)K3OHNRH6',student_number,answer_05, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 13:04:27');

% Grade it
fcn_GradeCodeX('fcn_CodeX_07_thatsOdd', answer_07, student_number);

%% Problem 8 - red light green light


%% Revision History:
%  2022_01_23:
%  -- created a demo script of core debug utilities, getting problems 0 and
%  to 1 to work
%  2022_02_02:
%  -- updated codes up to problem 5. Found an error where hash might
%  include a quote, and had to redo the hashing function to fix
% This code repo is version controlled within the Intelligent Vehicles and
% Systems Group (IVSG) at: https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises