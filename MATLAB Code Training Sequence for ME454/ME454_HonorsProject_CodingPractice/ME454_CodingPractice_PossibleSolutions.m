%% Task 1 Solution

password = task1(102098);

disp(password);

%% Task 2 Solution

for i = 1:9
    password = task2(i);
    if isnumeric(password)
        disp(password)
    end
end

%% Task 3 Solution

for i = 1:99999
    password = task3(i);
    if isnumeric(password)
        disp(password)
    end
end
%% Task 4 Solution 
list = task4();
password = [];
for i = 1:length(list)
    if mod(list(i), 2) == 1
        password = [password, '1'];
    else
        password = [password, '0'];
    end
end

disp(password)

%% Task 5 Solution
binary = task5();

count = 0;
sum = 0;
while binary > 0
    digit = mod(binary, 10);
    sum = sum + 2.^count*digit;
    binary = floor(binary/10);
    count = count + 1;
end

disp(sum)
%% Task 6 Solution

% Alternate solution to above problem using for loop

binary = num2str(task6(), 16);

sum = 0;
for digit = 1:length(binary)
    sum = sum + str2double(binary(digit))*2.^(length(binary) - digit);
end

disp(sum)

%% Task 7 Solution

range = 50000;

upperRange = 100000;
lowerRange = 0;

while task7(range) == 1 || task7(range) == 0
    if task7(range) == 1
        lowerRange = range;
        range = range + floor((upperRange - range)/2);
    else
        upperRange = range;
        range = range - floor((range - lowerRange)/2);
    end
end

disp(range)

%% Task 8 Solution

% Note: Task 8 could use the same function as task 6, and does here

hex = [];

binary = task6();

while binary > 0
    nibble = mod(binary, 10000);
    
    sum = 0;
    count = 0;
    while nibble > 0
        digit = mod(nibble, 10);
        sum = sum + digit*2.^count;
        nibble = floor(nibble/10);
        count = count + 1;
    end
    
    switch sum
        case 10
            hexdigit = 'a';
        case 11
            hexdigit = 'b';
        case 12
            hexdigit = 'c';
        case 13
            hexdigit = 'd';
        case 14
            hexdigit = 'e';
        case 15
            hexdigit = 'f';
        otherwise
            hexdigit = num2str(sum);
    end
    
    hex = [hexdigit, hex];
    
    binary = floor(binary/10000);
end

disp(hex)

%% Task 9 Solution

% Here try two potential solutions

timerValue = tic;

pause(1)

password = task9(timerValue);

disp(password)
%% Task 10 Solution
parity = task10();
password = [];

for p = 1:15
    sum = 0;
    stringParity = num2str(parity(p));
    for q = 1:length(stringParity)
        sum = sum + str2double(stringParity(q));
    end
    if mod(sum, 2) == 0
        password = [password, '1'];
    else
        password = [password, '0'];
    end
end

disp(password)

%% Task 11 Solution

num = task11();

message = [];
for i = 1:length(num)
    code = num(i);
    switch code
        case 65
            message = [message, 'A'];
        case 66
            message = [message, 'B'];
        case 67
            message = [message, 'C'];
        case 68
            message = [message, 'D'];
        case 69
            message = [message, 'E'];
        case 70
            message = [message, 'F'];
        case 71
            message = [message, 'G'];
        case 72
            message = [message, 'H'];
        case 73
            message = [message, 'I'];
        case 74
            message = [message, 'J'];
        case 75
            message = [message, 'K'];
        case 76
            message = [message, 'L'];
        case 77
            message = [message, 'M'];
        case 78
            message = [message, 'N'];
        case 79
            message = [message, 'O'];
        case 80
            message = [message, 'P'];
        case 81
            message = [message, 'Q'];
        case 82
            message = [message, 'R'];
        case 83
            message = [message, 'S'];
        case 84
            message = [message, 'T'];
        case 85
            message = [message, 'U'];
        case 86
           message = [message, 'V'];
        case 87
            message = [message, 'W'];
        case 88
            message = [message, 'X'];
        case 89
            message = [message, 'Y'];
        case 90
            message = [message, 'Z'];
        case 32
            message = [message, ' '];
    end
end

disp(message)
