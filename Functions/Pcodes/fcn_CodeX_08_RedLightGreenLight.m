% FCN_CODEX_08_REDLIGHTGREENLIGHT - find odd numbers
%    
%    Welcome to FCN_CODEX_08_REDLIGHTGREENLIGHT . This assignment pays
%    homage to the very famous children's game called "Red Light, Green
%    Light". As upcoming assignments will show, this game is also very
%    relevant to capitalism!
% 
%    For those who have never played the game, the instructions can be
%    found at many websites, for example:
% 
%        https://www.playworks.org/game-library/red-light-green-light/
% 
%    And are copied here:
% 
%   Start with everyone along the starting line, When you say 'Green Light'
%   everyone will move towards the finish line, When you say 'Red Light'
%   everyone must immediately stop. If players are still moving when you
%   call 'Red Light', they must go back to the starting line.
%  
%    Specifically: this function "plays" red-light-green-light with you by
%    acting as a signal. If the function is called without a "move":
% 
%    light_signal =
%    fcn_CodeX_08_RedLightGreenLight(entry_key,student_number);
%  
%    It will return a 0 if the light is "red", and 1 if the light is
%    "green". If the previous reading is "green", you are allowed to move
%    by inserting a non-zero move command:
% 
%    move_command = 1;
%    light_signal_status =
%    fcn_CodeX_08_RedLightGreenLight(entry_key,student_number,move_command);
% 
%    The function will then advance the player forward by 1 space and prints
%    the player's position. As well, it returns the next light signal.
%  
%    But if the light is "red" during a move command, then the player has to
%    go back to the start line and the player's position is set back to
%    zero. 
% 
%    The finish line is set at 1000 steps. Once a player crosses the finish
%    line, the function will output the answer_08 string that can be used in
%    the grading routine to complete the assignment. This can also be
%    queried directly from the function as additional output arguments:
% 
%    [light_signal_status, player_position, answer_08] =
%    fcn_CodeX_08_RedLightGreenLight(entry_key,student_number,move_command);
% 
%    The answer_08 code will be empty until the "finish line" is crossed.
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode and pass in the function name, student number, and answer.
% 
%    fcn_GradeCodeX('fcn_CodeX_08_RedLightGreenLight',student_number, answer_08);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
%