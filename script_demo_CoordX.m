
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

% The following entry keys change with each computer, and each student.

% % These are the keys for Dr. B's desktop PC, with student number 1234
% entry_key_01 = '(:^e1T.9afB+b<;HY<R';
% entry_key_02 = '(:^e1T.9afB(bLV=fJRU[I\I];=H';
% entry_key_03 = '(:^e1T.9afB)bS;=6JdHZ:[Pc';
% entry_key_04 = '(:^e1T.9afB.b?QI0U.U\U]HXPV=';
% entry_key_05 = '(:^e1T.9afB/bLV=fJ_R+K3OcNWH6';
% entry_key_06 = '(:^e1T.9afB,b:RS\>[;]H';
% entry_key_07 = '(:^e1T.9afB-bOV=fJd>*';
% entry_key_08 = '(:^e1T.9afBBbI;8^P,RZ<`95WTS5SN';
% entry_key_09 = '(:^e1T.9afBCbOQHZ<_U^T4HX<UUgUN=`W';
% entry_key_10 = '(:^e1T.9afC*b9Ke^V\I+W^TY>P';

% These are the keys for Dr. B's laptop PC, with student number 1234
entry_key_01 = '>:Ve1T-9efB+b<9HY<`';
entry_key_02 = '>:Ve1T-9efB(bLT=fJ`UYI\IV;8H';
entry_key_03 = '>:Ve1T-9efB)bS9=6JVHX:[PH';
entry_key_04 = '>:Ve1T-9efB.b?SI0U<U^U]HSPS=';
entry_key_05 = '>:Ve1T-9efB/bLT=fJMR)K3OHNRH6';
entry_key_06 = '>:Ve1T-9efB,b:PS\>I;_H';
entry_key_07 = '>:Ve1T-9efB-bOT=fJV>(';
entry_key_08 = '>:Ve1T-9efBBbI98^P>RX<`9>WQS5S^';
entry_key_09 = '>:Ve1T-9efBCbOSHZ<MU\T4HS<PUgU^=eW';
entry_key_10 = '>:Ve1T-9efC*b9Ie^VNI)W^TR>U';



% '(:^e1T.9afC*b9Ke^V\I+W^TY>P'


%% Problem 0 - setting up, but with student number
% Just call the function with no arguments to set up the next problem,
% problem 1!
student_number = 1234; % <--- this must be changed
fcn_GradeCodeX(student_number); 

%% Problem 01 - Translation

help fcn_CoordX_01_Translation