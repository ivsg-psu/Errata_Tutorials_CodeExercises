function MAC_address = fcn_CodeX_getComputerInfo(varargin) %#ok<FNDEF>
%% fcn_CodeX_getComputerInfo
% This is a helper function for the CodeX library that gets computer
% information from the computer including:
% MAC address

% [MAC_address] = fcn_CodeX_getComputerInfo
% Gets the computer information of the current computer
%
% FORMAT:
%
%      name_hash = fcn_CodeX_getComputerInfo(hashing_string,string_2_hash)
%
% INPUTS:
%
%      hashing_string: a string usually containing the student
%      number or student identifier
%
%      string_2_hash: the string that should be XOR hashed
%
%      (OPTIONAL INPUTS)
%
%      (none)
%
% OUTPUTS:
%
%      name_hash: the hashed output using XOR hashing
%
% DEPENDENCIES:
%
%      (none)
%
% EXAMPLES:
%
%     See the script: script_test_fcn_CodeX_getComputerInfo
%     for a full test suite.
%
% This function was written on 2023_01_25 by S. Brennan
% Questions or comments? sbrennan@psu.edu

% Revision history
%      2025_01_24:
%      -- refined examples, more comments, better interlacing

%% Debugging and Input checks

% Check if flag_max_speed set. This occurs if the fig_num variable input
% argument (varargin) is given a number of -1, which is not a valid figure
% number.
flag_max_speed = 0;
if (nargin==1 && isequal(varargin{end},-1))
    flag_do_debug = 0; % % % % Flag to plot the results for debugging
    flag_check_inputs = 0; % Flag to perform input checking
    flag_max_speed = 1;
else
    % Check to see if we are externally setting debug mode to be "on"
    flag_do_debug = 0; % % % % Flag to plot the results for debugging
    flag_check_inputs = 1; % Flag to perform input checking
    MATLABFLAG_CODEX_FLAG_CHECK_INPUTS = getenv("MATLABFLAG_CODEX_FLAG_CHECK_INPUTS");
    MATLABFLAG_CODEX_FLAG_DO_DEBUG = getenv("MATLABFLAG_CODEX_FLAG_DO_DEBUG");
    if ~isempty(MATLABFLAG_CODEX_FLAG_CHECK_INPUTS) && ~isempty(MATLABFLAG_CODEX_FLAG_DO_DEBUG)
        flag_do_debug = str2double(MATLABFLAG_CODEX_FLAG_DO_DEBUG);
        flag_check_inputs  = str2double(MATLABFLAG_CODEX_FLAG_CHECK_INPUTS);
    end
end

% flag_do_debug = 1;

if flag_do_debug
    st = dbstack; %#ok<*UNRCH>
    fprintf(1,'STARTING function: %s, in file: %s\n',st(1).name,st(1).file);
    debug_fig_num = 999978; %#ok<NASGU>
else
    debug_fig_num = []; %#ok<NASGU>
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

if (0 == flag_max_speed)
    if flag_check_inputs == 1
        % Are there the right number of inputs?
        narginchk(0,1);
    end
end

% Does user want to specify fid?
fid = 0;
if (0 == flag_max_speed) && (1 <= nargin)
    temp = varargin{end};
    if ~isempty(temp)
        fid = temp;
    end
end

flag_do_plots = 0; % Nothing to plot


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

mac_string = fcn_INTERNAL_getMACaddress;
MAC_address = replace(mac_string,':','');


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
if (1==flag_do_plots)

    % For debugging
    fprintf(fid,'Interlaced: %s\n',interlaced);

    % Nothing to plot!

end

if flag_do_debug
    fprintf(1,'ENDING function: %s, in file: %s\n\n',st(1).name,st(1).file);
end

end % Ends main function


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


%% fcn_INTERNAL_getMACaddress
function mac_string = fcn_INTERNAL_getMACaddress
networkinterfaces = java.net.NetworkInterface.getNetworkInterfaces;
nimacs = cell(0, 2);
while networkinterfaces.hasMoreElements
     networkinterface = networkinterfaces.nextElement;
     macstring = strjoin(cellstr(dec2hex(typecast(networkinterface.getHardwareAddress, 'uint8'))), ':');
     nimacs = [nimacs; {char(networkinterface.getDisplayName), macstring}]; %#ok<AGROW>
end

mac_string = [];
for ith_address = 1:length(nimacs(:,1))
    data = nimacs{ith_address,2};
    if ~isempty(data)
        mac_string  = cat(2,mac_string,data);
    end
end
mac_string = upper(mac_string);
end % Ends fcn_INTERNAL_getMACaddress
