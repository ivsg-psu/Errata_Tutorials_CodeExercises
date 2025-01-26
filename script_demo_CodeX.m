
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
%
% This code repo is version controlled within the Intelligent Vehicles and
% Systems Group (IVSG) at: https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises


%% Revision History:
%  2022_01_23: S. Brennan
%  -- created a demo script of core debug utilities, getting problems 0 and
%  to 1 to work
%  2022_02_02: S. Brennan
%  -- updated codes up to problem 5. Found an error where hash might
%  include a quote, and had to redo the hashing function to fix
%  2025_01_24: S. Brennan
%  -- created repo structure to match other IVSG repos including global
%  variables, initializations, etc. 

%% Prep the workspace
close all

%% Dependencies and Setup of the Code
% The code requires several other libraries to work, namely the following
% * DebugTools - the repo can be found at: https://github.com/ivsg-psu/Errata_Tutorials_DebugTools
%
% The section below installs dependencies in a folder called "Utilities"
% under the root folder, namely ./Utilities/DebugTools/ ,
% ./Utilities/PathClassLibrary/ . If you wish to put these codes in
% different directories, the function below can be easily modified with
% strings specifying the different location.

% List what libraries we need, and where to find the codes for each
clear library_name library_folders library_url

ith_library = 1;
library_name{ith_library}    = 'DebugTools_v2024_12_18';
library_folders{ith_library} = {'Functions','Data'};
library_url{ith_library}     = 'https://github.com/ivsg-psu/Errata_Tutorials_DebugTools/archive/refs/tags/DebugTools_v2024_12_18.zip';

% ith_library = ith_library+1;
% library_name{ith_library}    = 'PathClass_v2024_03_14';
% library_folders{ith_library} = {'Functions'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/PathPlanning_PathTools_PathClassLibrary/archive/refs/tags/PathClass_v2024_03_14.zip';
%
% ith_library = ith_library+1;
% library_name{ith_library}    = 'GPSClass_v2023_06_29';
% library_folders{ith_library} = {'Functions'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/FieldDataCollection_GPSRelatedCodes_GPSClass/archive/refs/tags/GPSClass_v2023_06_29.zip';
%
% ith_library = ith_library+1;
% library_name{ith_library}    = 'LineFitting_v2023_07_24';
% library_folders{ith_library} = {'Functions'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/FeatureExtraction_Association_LineFitting/archive/refs/tags/LineFitting_v2023_07_24.zip';
%
% ith_library = ith_library+1;
% library_name{ith_library}    = 'FindCircleRadius_v2023_08_02';
% library_folders{ith_library} = {'Functions'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/PathPlanning_GeomTools_FindCircleRadius/archive/refs/tags/FindCircleRadius_v2023_08_02.zip';
%
% ith_library = ith_library+1;
% library_name{ith_library}    = 'BreakDataIntoLaps_v2023_08_25';
% library_folders{ith_library} = {'Functions'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/FeatureExtraction_DataClean_BreakDataIntoLaps/archive/refs/tags/BreakDataIntoLaps_v2023_08_25.zip';
%
% ith_library = ith_library+1;
% library_name{ith_library}    = 'PlotRoad_v2024_09_14';
% library_folders{ith_library} = {'Functions', 'Data'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/FieldDataCollection_VisualizingFieldData_PlotRoad/archive/refs/tags/PlotRoad_v2024_09_14.zip';
%
% ith_library = ith_library+1;
% library_name{ith_library}    = 'GeometryClass_v2024_08_28';
% library_folders{ith_library} = {'Functions'};
% library_url{ith_library}     = 'https://github.com/ivsg-psu/PathPlanning_GeomTools_GeomClassLibrary/archive/refs/tags/GeometryClass_v2024_08_28.zip';
%


%% Clear paths and folders, if needed
if 1==0
    clear flag_CodeX_Folders_Initialized
    fcn_INTERNAL_clearUtilitiesFromPathAndFolders;

end

%% Do we need to set up the work space?
if ~exist('flag_CodeX_Folders_Initialized','var')
    this_project_folders = {'Functions',cat(2,'Functions',filesep,'Pcodes')};
    fcn_INTERNAL_initializeUtilities(library_name,library_folders,library_url,this_project_folders);
    flag_CodeX_Folders_Initialized = 1;
end


%% Set environment flags that define the ENU origin
% This sets the "center" of the ENU coordinate system for all plotting
% functions

% Location for Test Track base station
setenv('MATLABFLAG_PLOTROAD_REFERENCE_LATITUDE','40.86368573');
setenv('MATLABFLAG_PLOTROAD_REFERENCE_LONGITUDE','-77.83592832');
setenv('MATLABFLAG_PLOTROAD_REFERENCE_ALTITUDE','344.189');

% % Location for Pittsburgh, site 1
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_LATITUDE','40.44181017');
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_LONGITUDE','-79.76090840');
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_ALTITUDE','327.428');

% % Location for Site 2, Falling water
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_LATITUDE','39.995339');
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_LONGITUDE','-79.445472');
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_ALTITUDE','344.189');

% % Location for Aliquippa, site 3
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_LATITUDE','40.694871');
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_LONGITUDE','-80.263755');
% setenv('MATLABFLAG_PLOTROAD_REFERENCE_ALTITUDE','223.294');


%% Set environment flags for plotting
% These are values to set if we are forcing image alignment via Lat and Lon
% shifting, when doing geoplot. This is added because the geoplot images
% are very, very slightly off at the test track, which is confusing when
% plotting data
setenv('MATLABFLAG_PLOTROAD_ALIGNMATLABLLAPLOTTINGIMAGES_LAT','-0.0000008');
setenv('MATLABFLAG_PLOTROAD_ALIGNMATLABLLAPLOTTINGIMAGES_LON','0.0000054');


%% Set environment flags for input checking
% These are values to set if we want to check inputs or do debugging
% setenv('MATLABFLAG_FINDEDGE_FLAG_CHECK_INPUTS','1');
% setenv('MATLABFLAG_FINDEDGE_FLAG_DO_DEBUG','1');
setenv('MATLABFLAG_CODEX_FLAG_CHECK_INPUTS','1');
setenv('MATLABFLAG_CODEX_FLAG_DO_DEBUG','0');




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


%% Functions follow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ______                _   _
%  |  ____|              | | (_)
%  | |__ _   _ _ __   ___| |_ _  ___  _ __  ___
%  |  __| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
%  | |  | |_| | | | | (__| |_| | (_) | | | \__ \
%  |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
%
% See: https://patorjk.com/software/taag/#p=display&f=Big&t=Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%§

%% function fcn_INTERNAL_clearUtilitiesFromPathAndFolders
function fcn_INTERNAL_clearUtilitiesFromPathAndFolders
% Clear out the variables
clear global flag* FLAG*
clear flag*
clear path

% Clear out any path directories under Utilities
if ispc
    path_dirs = regexp(path,'[;]','split');
elseif ismac
    path_dirs = regexp(path,'[:]','split');
elseif isunix
    path_dirs = regexp(path,'[;]','split');
else
    error('Unknown operating system. Unable to continue.');
end

utilities_dir = fullfile(pwd,filesep,'Utilities');
for ith_dir = 1:length(path_dirs)
    utility_flag = strfind(path_dirs{ith_dir},utilities_dir);
    if ~isempty(utility_flag)
        rmpath(path_dirs{ith_dir})
    end
end

% Delete the Utilities folder, to be extra clean!
if  exist(utilities_dir,'dir')
    [status,message,message_ID] = rmdir(utilities_dir,'s');
    if 0==status
        error('Unable remove directory: %s \nReason message: %s \nand message_ID: %s\n',utilities_dir, message,message_ID);
    end
end

end % Ends fcn_INTERNAL_clearUtilitiesFromPathAndFolders

%% fcn_INTERNAL_initializeUtilities
function  fcn_INTERNAL_initializeUtilities(library_name,library_folders,library_url,this_project_folders)
% Reset all flags for installs to empty
clear global FLAG*

fprintf(1,'Installing utilities necessary for code ...\n');

% Dependencies and Setup of the Code
% This code depends on several other libraries of codes that contain
% commonly used functions. We check to see if these libraries are installed
% into our "Utilities" folder, and if not, we install them and then set a
% flag to not install them again.

% Set up libraries
for ith_library = 1:length(library_name)
    dependency_name = library_name{ith_library};
    dependency_subfolders = library_folders{ith_library};
    dependency_url = library_url{ith_library};

    fprintf(1,'\tAdding library: %s ...',dependency_name);
    fcn_INTERNAL_DebugTools_installDependencies(dependency_name, dependency_subfolders, dependency_url);
    clear dependency_name dependency_subfolders dependency_url
    fprintf(1,'Done.\n');
end

% Set dependencies for this project specifically
fcn_DebugTools_addSubdirectoriesToPath(pwd,this_project_folders);

disp('Done setting up libraries, adding each to MATLAB path, and adding current repo folders to path.');
end % Ends fcn_INTERNAL_initializeUtilities


function fcn_INTERNAL_DebugTools_installDependencies(dependency_name, dependency_subfolders, dependency_url, varargin)
%% FCN_DEBUGTOOLS_INSTALLDEPENDENCIES - MATLAB package installer from URL
%
% FCN_DEBUGTOOLS_INSTALLDEPENDENCIES installs code packages that are
% specified by a URL pointing to a zip file into a default local subfolder,
% "Utilities", under the root folder. It also adds either the package
% subfoder or any specified sub-subfolders to the MATLAB path.
%
% If the Utilities folder does not exist, it is created.
%
% If the specified code package folder and all subfolders already exist,
% the package is not installed. Otherwise, the folders are created as
% needed, and the package is installed.
%
% If one does not wish to put these codes in different directories, the
% function can be easily modified with strings specifying the
% desired install location.
%
% For path creation, if the "DebugTools" package is being installed, the
% code installs the package, then shifts temporarily into the package to
% complete the path definitions for MATLAB. If the DebugTools is not
% already installed, an error is thrown as these tools are needed for the
% path creation.
%
% Finally, the code sets a global flag to indicate that the folders are
% initialized so that, in this session, if the code is called again the
% folders will not be installed. This global flag can be overwritten by an
% optional flag input.
%
% FORMAT:
%
%      fcn_DebugTools_installDependencies(...
%           dependency_name, ...
%           dependency_subfolders, ...
%           dependency_url)
%
% INPUTS:
%
%      dependency_name: the name given to the subfolder in the Utilities
%      directory for the package install
%
%      dependency_subfolders: in addition to the package subfoder, a list
%      of any specified sub-subfolders to the MATLAB path. Leave blank to
%      add only the package subfolder to the path. See the example below.
%
%      dependency_url: the URL pointing to the code package.
%
%      (OPTIONAL INPUTS)
%      flag_force_creation: if any value other than zero, forces the
%      install to occur even if the global flag is set.
%
% OUTPUTS:
%
%      (none)
%
% DEPENDENCIES:
%
%      This code will automatically get dependent files from the internet,
%      but of course this requires an internet connection. If the
%      DebugTools are being installed, it does not require any other
%      functions. But for other packages, it uses the following from the
%      DebugTools library: fcn_DebugTools_addSubdirectoriesToPath
%
% EXAMPLES:
%
% % Define the name of subfolder to be created in "Utilities" subfolder
% dependency_name = 'DebugTools_v2023_01_18';
%
% % Define sub-subfolders that are in the code package that also need to be
% % added to the MATLAB path after install; the package install subfolder
% % is NOT added to path. OR: Leave empty ({}) to only add
% % the subfolder path without any sub-subfolder path additions.
% dependency_subfolders = {'Functions','Data'};
%
% % Define a universal resource locator (URL) pointing to the zip file to
% % install. For example, here is the zip file location to the Debugtools
% % package on GitHub:
% dependency_url = 'https://github.com/ivsg-psu/Errata_Tutorials_DebugTools/blob/main/Releases/DebugTools_v2023_01_18.zip?raw=true';
%
% % Call the function to do the install
% fcn_DebugTools_installDependencies(dependency_name, dependency_subfolders, dependency_url)
%
% This function was written on 2023_01_23 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% Revision history:
% 2023_01_23:
% -- wrote the code originally
% 2023_04_20:
% -- improved error handling
% -- fixes nested installs automatically

% TO DO
% -- Add input argument checking

flag_do_debug = 0; % Flag to show the results for debugging
flag_do_plots = 0; % % Flag to plot the final results
flag_check_inputs = 1; % Flag to perform input checking

if flag_do_debug
    st = dbstack; %#ok<*UNRCH>
    fprintf(1,'STARTING function: %s, in file: %s\n',st(1).name,st(1).file);
end


%% check input arguments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   _____                   _
%  |_   _|                 | |
%    | |  _ __  _ __  _   _| |_ ___
%    | | | '_ \| '_ \| | | | __/ __|
%   _| |_| | | | |_) | |_| | |_\__ \
%  |_____|_| |_| .__/ \__,_|\__|___/
%              | |
%              |_|
% See: http://patorjk.com/software/taag/#p=display&f=Big&t=Inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if flag_check_inputs
    % Are there the right number of inputs?
    narginchk(3,4);
end

%% Set the global variable - need this for input checking
% Create a variable name for our flag. Stylistically, global variables are
% usually all caps.
flag_varname = upper(cat(2,'flag_',dependency_name,'_Folders_Initialized'));

% Make the variable global
eval(sprintf('global %s',flag_varname));

if nargin==4
    if varargin{1}
        eval(sprintf('clear global %s',flag_varname));
    end
end

%% Main code starts here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   __  __       _
%  |  \/  |     (_)
%  | \  / | __ _ _ _ __
%  | |\/| |/ _` | | '_ \
%  | |  | | (_| | | | | |
%  |_|  |_|\__,_|_|_| |_|
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



if ~exist(flag_varname,'var') || isempty(eval(flag_varname))
    % Save the root directory, so we can get back to it after some of the
    % operations below. We use the Print Working Directory command (pwd) to
    % do this. Note: this command is from Unix/Linux world, but is so
    % useful that MATLAB made their own!
    root_directory_name = pwd;

    % Does the directory "Utilities" exist?
    utilities_folder_name = fullfile(root_directory_name,'Utilities');
    if ~exist(utilities_folder_name,'dir')
        % If we are in here, the directory does not exist. So create it
        % using mkdir
        [success_flag,error_message,message_ID] = mkdir(root_directory_name,'Utilities');

        % Did it work?
        if ~success_flag
            error('Unable to make the Utilities directory. Reason: %s with message ID: %s\n',error_message,message_ID);
        elseif ~isempty(error_message)
            warning('The Utilities directory was created, but with a warning: %s\n and message ID: %s\n(continuing)\n',error_message, message_ID);
        end

    end

    % Does the directory for the dependency folder exist?
    dependency_folder_name = fullfile(root_directory_name,'Utilities',dependency_name);
    if ~exist(dependency_folder_name,'dir')
        % If we are in here, the directory does not exist. So create it
        % using mkdir
        [success_flag,error_message,message_ID] = mkdir(utilities_folder_name,dependency_name);

        % Did it work?
        if ~success_flag
            error('Unable to make the dependency directory: %s. Reason: %s with message ID: %s\n',dependency_name, error_message,message_ID);
        elseif ~isempty(error_message)
            warning('The %s directory was created, but with a warning: %s\n and message ID: %s\n(continuing)\n',dependency_name, error_message, message_ID);
        end

    end

    % Do the subfolders exist?
    flag_allFoldersThere = 1;
    if isempty(dependency_subfolders{1})
        flag_allFoldersThere = 0;
    else
        for ith_folder = 1:length(dependency_subfolders)
            subfolder_name = dependency_subfolders{ith_folder};

            % Create the entire path
            subfunction_folder = fullfile(root_directory_name, 'Utilities', dependency_name,subfolder_name);

            % Check if the folder and file exists that is typically created when
            % unzipping.
            if ~exist(subfunction_folder,'dir')
                flag_allFoldersThere = 0;
            end
        end
    end

    % Do we need to unzip the files?
    if flag_allFoldersThere==0
        % Files do not exist yet - try unzipping them.
        save_file_name = tempname(root_directory_name);
        zip_file_name = websave(save_file_name,dependency_url);
        % CANT GET THIS TO WORK --> unzip(zip_file_url, debugTools_folder_name);

        % Is the file there?
        if ~exist(zip_file_name,'file')
            error(['The zip file: %s for dependency: %s did not download correctly.\n' ...
                'This is usually because permissions are restricted on ' ...
                'the current directory. Check the code install ' ...
                '(see README.md) and try again.\n'],zip_file_name, dependency_name);
        end

        % Try unzipping
        unzip(zip_file_name, dependency_folder_name);

        % Did this work? If so, directory should not be empty
        directory_contents = dir(dependency_folder_name);
        if isempty(directory_contents)
            error(['The necessary dependency: %s has an error in install ' ...
                'where the zip file downloaded correctly, ' ...
                'but the unzip operation did not put any content ' ...
                'into the correct folder. ' ...
                'This suggests a bad zip file or permissions error ' ...
                'on the local computer.\n'],dependency_name);
        end

        % Check if is a nested install (for example, installing a folder
        % "Toolsets" under a folder called "Toolsets"). This can be found
        % if there's a folder whose name contains the dependency_name
        flag_is_nested_install = 0;
        for ith_entry = 1:length(directory_contents)
            if contains(directory_contents(ith_entry).name,dependency_name)
                if directory_contents(ith_entry).isdir
                    flag_is_nested_install = 1;
                    install_directory_from = fullfile(directory_contents(ith_entry).folder,directory_contents(ith_entry).name);
                    install_files_from = fullfile(directory_contents(ith_entry).folder,directory_contents(ith_entry).name,'*'); % BUG FIX - For Macs, must be *, not *.*
                    install_location_to = fullfile(directory_contents(ith_entry).folder);
                end
            end
        end

        if flag_is_nested_install
            [status,message,message_ID] = movefile(install_files_from,install_location_to);
            if 0==status
                error(['Unable to move files from directory: %s\n ' ...
                    'To: %s \n' ...
                    'Reason message: %s\n' ...
                    'And message_ID: %s\n'],install_files_from,install_location_to, message,message_ID);
            end
            [status,message,message_ID] = rmdir(install_directory_from);
            if 0==status
                error(['Unable remove directory: %s \n' ...
                    'Reason message: %s \n' ...
                    'And message_ID: %s\n'],install_directory_from,message,message_ID);
            end
        end

        % Make sure the subfolders were created
        flag_allFoldersThere = 1;
        if ~isempty(dependency_subfolders{1})
            for ith_folder = 1:length(dependency_subfolders)
                subfolder_name = dependency_subfolders{ith_folder};

                % Create the entire path
                subfunction_folder = fullfile(root_directory_name, 'Utilities', dependency_name,subfolder_name);

                % Check if the folder and file exists that is typically created when
                % unzipping.
                if ~exist(subfunction_folder,'dir')
                    flag_allFoldersThere = 0;
                end
            end
        end
        % If any are not there, then throw an error
        if flag_allFoldersThere==0
            error(['The necessary dependency: %s has an error in install, ' ...
                'or error performing an unzip operation. The subfolders ' ...
                'requested by the code were not found after the unzip ' ...
                'operation. This suggests a bad zip file, or a permissions ' ...
                'error on the local computer, or that folders are ' ...
                'specified that are not present on the remote code ' ...
                'repository.\n'],dependency_name);
        else
            % Clean up the zip file
            delete(zip_file_name);
        end

    end


    % For path creation, if the "DebugTools" package is being installed, the
    % code installs the package, then shifts temporarily into the package to
    % complete the path definitions for MATLAB. If the DebugTools is not
    % already installed, an error is thrown as these tools are needed for the
    % path creation.
    %
    % In other words: DebugTools is a special case because folders not
    % added yet, and we use DebugTools for adding the other directories
    if strcmp(dependency_name(1:10),'DebugTools')
        debugTools_function_folder = fullfile(root_directory_name, 'Utilities', dependency_name,'Functions');

        % Move into the folder, run the function, and move back
        cd(debugTools_function_folder);
        fcn_DebugTools_addSubdirectoriesToPath(dependency_folder_name,dependency_subfolders);
        cd(root_directory_name);
    else
        try
            fcn_DebugTools_addSubdirectoriesToPath(dependency_folder_name,dependency_subfolders);
        catch
            error(['Package installer requires DebugTools package to be ' ...
                'installed first. Please install that before ' ...
                'installing this package']);
        end
    end


    % Finally, the code sets a global flag to indicate that the folders are
    % initialized.  Check this using a command "exist", which takes a
    % character string (the name inside the '' marks, and a type string -
    % in this case 'var') and checks if a variable ('var') exists in matlab
    % that has the same name as the string. The ~ in front of exist says to
    % do the opposite. So the following command basically means: if the
    % variable named 'flag_CodeX_Folders_Initialized' does NOT exist in the
    % workspace, run the code in the if statement. If we look at the bottom
    % of the if statement, we fill in that variable. That way, the next
    % time the code is run - assuming the if statement ran to the end -
    % this section of code will NOT be run twice.

    eval(sprintf('%s = 1;',flag_varname));
end


%% Plot the results (for debugging)?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   _____       _
%  |  __ \     | |
%  | |  | | ___| |__  _   _  __ _
%  | |  | |/ _ \ '_ \| | | |/ _` |
%  | |__| |  __/ |_) | |_| | (_| |
%  |_____/ \___|_.__/ \__,_|\__, |
%                            __/ |
%                           |___/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if flag_do_plots

    % Nothing to do!



end

if flag_do_debug
    fprintf(1,'ENDING function: %s, in file: %s\n\n',st(1).name,st(1).file);
end

end % Ends function fcn_DebugTools_installDependencies

