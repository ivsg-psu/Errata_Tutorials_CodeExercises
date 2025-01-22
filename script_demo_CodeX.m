
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
% "startup" mode. As a suggestion, use "clear all" sparingly - in many
% codes, the workspace variables are set to avoid repeated calculations. So
% if they are cleared each time, it very much slows code down. A good
% practice is to use functions as these contain and use variables only when
% they are called and within the code of the function only.


%% Problem 0 - setting up!
% Just call the grading function with no arguments to set up the next problem,
% problem 1!

fcn_GradeCodeX; 

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


%% Problem 2 - arguments in
list = fcn_CodeX_02_whatsYourNumber(entry_key_02,student_number);

% Solve the problem
answer_02 = find(list==student_number,1);

% Grade it
fcn_GradeCodeX('fcn_CodeX_02_whatsYourNumber', answer_02, student_number);

%% Problem 3 - heads or tails
output_result = fcn_CodeX_03_headsOrTails(entry_key_03,student_number);

% Solve the problem
answer_03 = output_result>=0.5; 

% Grade it
fcn_GradeCodeX('fcn_CodeX_03_headsOrTails', answer_03, student_number);

%% Problem 4 - double or nothing
output_result = fcn_CodeX_04_doubleOrNothing(entry_key_04,student_number);

% Solve the problem
answer_04 = find(output_result == intersect(output_result,2*output_result)); 

%  Deep debugging
% results = fcn_CodeX_04_doubleOrNothing_KEEP('VR^MY\%QMN*&JW[AX]T]6]U@[X[U',student_number,answer_04, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 03:57:53');

% Grade it
fcn_GradeCodeX('fcn_CodeX_04_doubleOrNothing', answer_04, student_number);

%% Problem 5 - what's the password?
guesses = (0:9)';
output_result = fcn_CodeX_05_whatsThePassword(entry_key_05,student_number,guesses);

% Solve the problem
answer_05 = find(output_result == 1)-1; 

% FOR Deep debugging
% results = fcn_CodeX_05_whatsThePassword_KEEP('>:Ve1T-9efB/bLT=fJMR)K3OHNRH6',student_number,answer_05, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 13:04:27');

% Grade it
fcn_GradeCodeX('fcn_CodeX_05_whatsThePassword', answer_05, student_number);


%% Problem 6 - a long pass
guesses = (0:99999999)';
output_result = fcn_CodeX_06_aLongPass(entry_key_06,student_number,guesses);

% Solve the problem
answer_06 = find(output_result == 1)-1; 

% FOR Deep debugging
% results = fcn_CodeX_06_aLongPass_KEEP('>:Ve1T-9efB/bLT=fJMR)K3OHNRH6',student_number,answer_05, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 13:04:27');

% Grade it
fcn_GradeCodeX('fcn_CodeX_06_aLongPass', answer_06, student_number);

%% Problem 7 - thats odd
some_odd_numbers = fcn_CodeX_07_thatsOdd(entry_key_07,student_number);

% Solve the problem
answer_07 = mod(some_odd_numbers,2)==1;

% FOR Deep debugging
% results = fcn_CodeX_07_thatsOdd_KEEP('>:Ve1T-9efB/bLT=fJMR)K3OHNRH6',student_number,answer_05, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'02-Feb-2023 13:04:27');

% Grade it
fcn_GradeCodeX('fcn_CodeX_07_thatsOdd', answer_07, student_number);

%% Problem 8 - red light green light

% Plot the results to check
light_signals = zeros(2000,1);
player_positions = zeros(2000,1);
move_command = 0;
for ith_call = 1:length(light_signals)
    fprintf(1,'Iteration: %.0d\n',ith_call);
    [light_signal_status, player_position, answer_08] = fcn_CodeX_08_RedLightGreenLight(entry_key_08,student_number,move_command);
    light_signals(ith_call,1) = light_signal_status;
    player_positions(ith_call,1) = player_position;
    
    if ~isempty(answer_08)
        break
    end
end
figure(2222);
clf;
hold on;
grid on;
plot(light_signals);
plot(player_positions);
legend('Light signals','Player position');

% Give a stupid input, and check that it zeros students
light_signals = zeros(2000,1);
player_positions = zeros(2000,1);
move_command = 1;
for ith_call = 1:length(light_signals)
    [light_signal_status, player_position, answer_08] = fcn_CodeX_08_RedLightGreenLight(entry_key_08,student_number,move_command);
    light_signals(ith_call,1) = light_signal_status;
    player_positions(ith_call,1) = player_position;
    if ~isempty(answer_08)
        break
    end
end
figure(3333);
clf;
hold on;
grid on;
plot(light_signals);
plot(player_positions);
legend('Light signals','Player position');


% Solve the problem
move_command = 0;
[light_signal_status, player_position, answer_08] = ...
   fcn_CodeX_08_RedLightGreenLight(entry_key_08,student_number,move_command);

% Wait at the starting line for the light to turn green
while light_signal_status==0
    [light_signal_status, player_position, answer_08] = ...
   fcn_CodeX_08_RedLightGreenLight(entry_key_08,student_number,move_command);
end

positions = nan(20000,1);
light_signals = positions;

current_position = 1;
while isempty(answer_08)
    % Keep moving forward in a green light
    move_command = 1;
    while light_signal_status==1 && isempty(answer_08)
        [light_signal_status, positions(current_position,1), answer_08] = ...
            fcn_CodeX_08_RedLightGreenLight(entry_key_08,student_number,move_command);
        light_signals(current_position,1) = light_signal_status;
        current_position = current_position+1;
    end
    % Wait for the red light to stop
    move_command = 0;
    while light_signal_status==0 && isempty(answer_08)
        [light_signal_status, positions(current_position,1), answer_08] = ...
            fcn_CodeX_08_RedLightGreenLight(entry_key_08,student_number,move_command);
        light_signals(current_position,1) = light_signal_status;
        current_position = current_position+1;
    end
end

figure(838383);
clf;
hold on;
grid on;
plot(light_signals);
plot(positions);
legend('Light signals','Player position');

answer_08 = ';VV=`:]IQ8fSRUO';

% Grade it
fcn_GradeCodeX('fcn_CodeX_08_RedLightGreenLight', answer_08, student_number);

%% Problem 9 - to the top of the mountain

% Do a guess to initialize the key
highest_peak_guess = 2;
fcn_CodeX_09_ToTheTopOfTheMountain(entry_key_09,student_number,highest_peak_guess);

% Plot the results to check
elevations = nan(2000,1);
for ith_call = 1:length(elevations)
    fprintf(1,'Iteration: %.0d\n',ith_call);
    [current_elevation, ~] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key_09,student_number);
    elevations(ith_call,1) = current_elevation;
end
figure(44444);
clf;
hold on;
grid on;
plot(elevations);
legend('Elevation');

% %% Give a stupid input, and check that it delays 
% highest_peak_guess = 0;
% [current_elevation, answer_09] = fcn_CodeX_09_ToTheTopOfTheMountain_KEEP(entry_key_09,student_number,highest_peak_guess);


% Solve the problem
elevations = nan(2000,1);
highest_peak_guess = [];

% Wait for elevation to rise
[new_elevation, ~] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key_09,student_number,highest_peak_guess);
old_elevation = inf;
current_count = 1;
while new_elevation<old_elevation
    old_elevation = new_elevation;
    elevations(current_count,1) = new_elevation;
    current_count = current_count+1;
    [new_elevation, ~] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key_09,student_number,highest_peak_guess);
end
elevations(current_count,1) = new_elevation;


% Wait for the elevation to drop
old_elevation = -inf;
while new_elevation>old_elevation
    old_elevation = new_elevation;
    elevations(current_count,1) = new_elevation;
    current_count = current_count+1;
    [new_elevation, ~] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key_09,student_number,highest_peak_guess);
end
elevations(current_count,1) = new_elevation;

% Check answer
[~, answer_09] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key_09,student_number,old_elevation);
fprintf(1,'The final answer is: %s\n',answer_09);

% Plot results to confirm
figure(98746);
clf;
hold on;
grid on;
plot(elevations);

% %% Deep debugging
% answer_09 = 'O<TV6Tg9';
% results = fcn_CodeX_09_ToTheTopOfTheMountain_KEEP('>:Ve1T-9efBCbOSHZ<MU\T4HS<PUgU^=eW',student_number,answer_09, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'04-Feb-2023 05:24:34');

% Grade it
answer_09 = 'O<TV6Tg9'; % FOR PC --> 'Y<\V6Td9';
fcn_GradeCodeX('fcn_CodeX_09_ToTheTopOfTheMountain', answer_09, student_number);

%% Problem 10 - buy low, sell high

% Do a investment to initialize the key
investment_in_or_out = 0;
fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);

% Plot the market index to check
market_indices = nan(2000,1);
for ith_call = 1:length(market_indices)
    fprintf(1,'Iteration: %.0d\n',ith_call);
    [current_market_index, ~, ~] = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number);
    market_indices(ith_call,1) = current_market_index;
end
figure(44444);
clf;
hold on;
grid on;
plot(market_indices);
legend('Market Indices');

%% Give a stupid input, to take out more than what is in there
investment_in_or_out = -2000;
[~, ~, ~] = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);

%% Give a stupid input, to put in more than what is in there
investment_in_or_out = 2000;
[~, ~, ~] = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);

%%
% Solve the problem
% Reset internal variables
fcn_CodeX_10_BuyLowSellHigh;

max_counts = 20000;
market_indices = nan(max_counts,1);
investment_values = nan(max_counts,1);
current_count = 1;

% Query the market
investment_in_or_out = 0;
[~, current_investment_value, ~, ~]  = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);

% Pull everything out to start
investment_in_or_out = -1*current_investment_value;
[current_market_index, current_investment_value, current_money_available_to_invest, answer_10]  = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);

flag_goal_reached = 0;
good_answer = []; % Empty
while (flag_goal_reached==0) && (current_count<max_counts)
    
    % Wait for the current_market_index to stop dropping
    old_market_index = inf;
    investment_in_or_out = 0;
    while current_market_index<old_market_index
        old_market_index = current_market_index;
        market_indices(current_count,1) = current_market_index;
    investment_values(current_count,1) = current_investment_value+current_money_available_to_invest;
        current_count = current_count+1;
        [current_market_index, current_investment_value, current_money_available_to_invest, answer_10]  = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);
    end        
    if ~isempty(answer_10)
        flag_goal_reached = 1;
        good_answer = answer_10; % Save the result
    end
    
    % When at the lowest, invest everything
    investment_in_or_out = current_money_available_to_invest;
    old_market_index = current_market_index;
    market_indices(current_count,1) = current_market_index;
    investment_values(current_count,1) = current_investment_value+current_money_available_to_invest;
    current_count = current_count+1;
    [current_market_index, current_investment_value, current_money_available_to_invest, answer_10]  = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);    
    if ~isempty(answer_10)
        flag_goal_reached = 1;
        good_answer = answer_10; % Save the result
    end
    
    % Wait for the current_market_index to stop rising
    investment_in_or_out = 0;
    while current_market_index>old_market_index
        old_market_index = current_market_index;
        market_indices(current_count,1) = current_market_index;
    investment_values(current_count,1) = current_investment_value+current_money_available_to_invest;
        current_count = current_count+1;
        [current_market_index, current_investment_value, current_money_available_to_invest, answer_10]  = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);
    end    
    if ~isempty(answer_10)
        flag_goal_reached = 1;
        good_answer = answer_10; % Save the result
    end
    
    % When at the highest, divest everything
    investment_in_or_out = -current_investment_value;
    old_market_index = current_market_index;
    market_indices(current_count,1) = current_market_index;
    investment_values(current_count,1) = current_investment_value+current_money_available_to_invest;
    current_count = current_count+1;
    [current_market_index, current_investment_value, current_money_available_to_invest, answer_10]  = fcn_CodeX_10_BuyLowSellHigh(entry_key_10,student_number,investment_in_or_out);    
    if ~isempty(answer_10)
        flag_goal_reached = 1;
        good_answer = answer_10; % Save the result
    end
    
    figure(454545);
    clf;
    hold on;
    grid on;
    plot(market_indices);
    plot(investment_values);
    legend('Market Indices','Current investment');
    pause(0.1);

end
answer_10 = good_answer;
% Check answer
fprintf(1,'The final answer is: %s\n',answer_10);


% %% Deep debugging
% answer_09 = 'O<TV6Tg9';
% results = fcn_CodeX_10_BuyLowSellHigh_KEEP('>:Ve1T-9efBCbOSHZ<MU\T4HS<PUgU^=eW',student_number,answer_09, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],'04-Feb-2023 05:24:34');

% Grade it
fcn_GradeCodeX('fcn_CodeX_10_BuyLowSellHigh', answer_10, student_number);
%% Revision History:
%  2022_01_23:
%  -- created a demo script of core debug utilities, getting problems 0 and
%  to 1 to work
%  2022_02_02:
%  -- updated codes up to problem 5. Found an error where hash might
%  include a quote, and had to redo the hashing function to fix
% This code repo is version controlled within the Intelligent Vehicles and
% Systems Group (IVSG) at: https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises