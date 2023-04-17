# Errata_Tutorials_CodeExercises

<!--
The following template is based on:
Best-README-Template
Search for this, and you will find!
>
<!-- PROJECT LOGO -->
<br />
<p align="center">
  <!-- <a href="https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises">
    <img src="img" alt="Logo" width="80" height="80">
  </a> -->

  <h2 align="center"> Errata_Tutorials_CodeExercises
  </h2>

  <p align="center">
    This code is developed to test students on basic coding skills in MATLAB.
    <br />
    <!--a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation"><strong>Explore the docs</strong></a>
    <br />
    <br />
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/tree/main/Documents">View Demo</a>
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/issues">Report Bug</a>
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/issues">Request Feature</a-->
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
        <a href="#about-the-code-exercises">About the Code Exercises</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
        <ul>
            <li><a href="#installation">Installation</a></li>
        </ul>
    </li>
    <li>
      <a href="#repo-structure">Repo Structure</a>
        <ul>
          <li><a href="#directories">Top-Level Directories</li>
          <li><a href="#dependencies">Dependencies</li>
        </ul>
    </li>
    <li>
    <a href="#functions">Functions</a>
      <ul>
      <li><a href="#codex-functions">CodeX Functions</a></li>
        <ul>
          <li><a href="#fcn_codex_01_getkey">fcn_CodeX_01_getKey</li>
          <li><a href="#fcn_codex_02_whatsyournumber">fcn_CodeX_02_whatsYourNumber</li>
          <li><a href="#fcn_codex_03_headsortails">fcn_CodeX_03_headsOrTails</li>
          <li><a href="#fcn_codex_04_doubleornothing">fcn_CodeX_04_doubleOrNothing</li>
          <li><a href="#fcn_codex_05_whatsthepassword">fcn_CodeX_05_whatsThePassword</li>
          <li><a href="#fcn_codex_06_alongpass">fcn_CodeX_06_aLongPass</li>
          <li><a href="#fcn_codex_07_thatsodd">fcn_CodeX_07_thatsOdd</li>
          <li><a href="#fcn_codex_08_redlightgreenlight">fcn_CodeX_08_RedLightGreenLight</li>
          <li><a href="#fcn_codex_09_tothetopofthemountain">fcn_CodeX_09_ToTheTopOfTheMountain</li>
          <li><a href="#fcn_codex_10_buylowsellhigh">fcn_CodeX_10_BuyLowSellHigh</li>
        </ul>
        <li><a href="#coordx-functions">CoordX Functions</a></li>
        <ul>
          <li><a href="#fcn_coordx_01_translation">fcn_CoordX_01_Translation</li>
          <li><a href="#fcn_coordx_02_rotation">fcn_CoordX_02_Rotation</li>
          <li><a href="#fcn_coordx_03_practiceregression">fcn_CoordX_03_practiceRegression</li>
          <li><a href="#fcn_coordx_04_practicescaling">fcn_CoordX_04_practiceScaling</li>
          <li><a href="#fcn_coordx_05_findscalingparameter">fcn_CoordX_05_findScalingParameter</li>
          <li><a href="#fcn_coordx_06_produce2dhomogeneoustranformmatrix">fcn_CoordX_06_produce2DHomogeneousTranformMatrix</li>
          <li><a href="#fcn_coordx_07_practicekabschsalgorithm">fcn_CoordX_07_practiceKabschsAlgorithm</li>
          <li><a href="#fcn_coordx_08_findhomogeneoustransformmatrix">fcn_CoordX_08_findHomogeneousTransformMatrix</li>
          <li><a href="#fcn_coordx_09_findaffinetransformmatrix">fcn_CoordX_09_findAffineTransformMatrix</li>
          <li><a href="#fcn_codex_10_buylowsellhigh">fcn_CodeX_10_BuyLowSellHigh</li>
        </ul>
        </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
        <ul>
          <li><a href="#examples">Examples</li>
        </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Code Exercises

<!--[![Product Name Screen Shot][product-screenshot]](https://example.com)-->

There are ten functions in this repo. Each function represents a coding exercise. The level of difficulty increases with the coding exercises. The first one is as simple as just entering a number, and in the last one, the user needs to earn money by investing a dollar in a stock market simulation. Users can only see two assignments (functions) and the corresponding "entry key" simultaneously. An entry key is a unique passcode; the user must enter it to solve a particular problem. Whenever a user restarts the program, the code generates new entry keys to all the functions. The user must start solving from the first assignment. A user can unlock the next assignment only if the answer to the current assignment is correct. The usage of this repo is detailed in the "Usage" section below.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- GETTING STARTED -->
## Getting Started

To start the coding exercise, follow the steps below.

### Installation

1. Paste 'fcn_GradeCodeX.p' file in a new directory on your machine and open it.

2. It creates a Utility folder within the directory and asks you to enter your ‘student number’ in the command window.

3. Enter a number in the command window. It checks all 10 code dependencies and displays the first two functions.

4. Start solving the coding exercises. Only two exercises and the corresponding entry keys are displayed in the command window. The user must solve the current assignment to complete the next assignment. For instance, the user must solve the first exercise to solve the second exercise.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- STRUCTURE OF THE REPO -->
## Repo Structure

### Directories

The following are the top level directories within the repository:

* Functions Folder: All ten coding assignments are present in this directory.

* Utilities folder: Dependencies that are utilized but not implemented in this repository are placed in the Utilities directory. These can be single files but are most often folders containing other cloned repositories.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

### Dependencies

This code will automatically get dependent files from the internet, which requires an internet connection during the first instance that it is run.

Note: An internet connection is not needed after the first run.

* [Errata_Tutorials_DebugTools](https://github.com/ivsg-psu/Errata_Tutorials_DebugTools) - The DebugTools repo is used for the initial automated folder setup, and for input checking and general debugging calls within subfunctions. The repo can be found at: <https://github.com/ivsg-psu/Errata_Tutorials_DebugTools>

* [Codex_2023_02_19](https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises/tree/main/Releases) - This dependency is found within this repo in "Releases" directory. This repo can be found at: <https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises>

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- FUNCTION DEFINITIONS -->
## Functions

### CodeX Functions

#### fcn_CodeX_01_getKey

In this assignment, the user needs to input an entry key and a student number. The answer for this assignment is just a single line of code. This function helps the user to understand how to use an entry key to solve the assignment. For instance, if an entry key of this function is 'jdf83u8jd` 8' and student number of the user is 10

```Matlab
entry_key = 'jdf83u8jd` 8';
student_number = 10;

answer = fcn_CodeX_01_getKey(entry_key, student_number);
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCodeX.

```Matlab
student_number = 10;

fcn_GradeCodeX('fcn_CodeX_01_getKey',answer, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_02_whatsYourNumber

In this assignment, the user needs to find the user's student number from a list of numbers and should return the index (row) of the student number. Unlike the previous function, this function generates a list of numbers. The answer to this assignment is the row number of the user's student number. For example, if the user's student number is 25. The "fcn_CodeX_02_whatsYourNumber" generates a list of numbers, and 25 would be one of the numbers. The user should find the row where 25 is located.

```Matlab
entry_key = '!)ehf%6kjf fif';
student_number = 10;

result_02_list = fcn_CodeX_02_whatsYourNumber(entry_key,student_number);

answer_02 = ; %write a code to find row number where student number is located
```

Similarly, user should verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_02_whatsYourNumber',answer_02, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_03_headsOrTails

In this assignment, the user needs to return a vector of zeroes and ones from a random row vector (50 elements) composed of values between 0 to 1. If the value is less than 0.5, the user should return 0 (tails); if the value is greater than 0.5, the user should return 1 (heads). This function generates a random vector of 50 elements. For example,

```Matlab
entry_key = '^&*877bHKK***2jbhd u&((**)0)';
student_number = 10;

random_vector = fcn_CodeX_03_headsOrTails(entry_key,student_number);


random_vector =
   
       0.5681
       0.8691
       0.4362
       0.8021
       0.1438 
      (etc)

%user should return

answer_03 =
   
       1
       1
       0
       1
       0 
       (etc)
```

The user needs to verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_03_headsOrTails',answer_03, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_04_doubleOrNothing

In this assignment, the function returns a random vector of 50 numbers. The user needs to find the number that is **exactly** twice as big as one of the other 49 numbers and should return the row of the **double** number. For example,

```Matlab
entry_key = 'ABCD$%^&TTT hdghgh`~`~';
student_number = 10;

random_vector = fcn_CodeX_04_doubleOrNothing(entry_key,student_number);

random_vector =
   
       0.5681
       0.2876
       0.4362
       0.8021
       0.1438
       (etc)

%user should return

answer_04 = 2; 

%Since 2nd row is twice the value of the 5th row
```

**Note**: The easiest way to solve this assignment is to write your own function

The user needs to should verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_04_doubleOrNothing',answer_04, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_05_whatsThePassword

In this assignment, the function returns **true** if the user guesses the correct integer password and returns **false** otherwise. The range of password is 0-9. Unlike the previous functions, this function can take three input arguments. The user's guess is the third input argument.

```Matlab
entry_key = ' ^&^*^#^djhAHYBj $643gv';  
student_number = 10; 

guess = 2; %Varies from 0 to 9
true_false = fcn_CodeX_05_whatsThePassword(entry_key,student_number,guess);

%for correct password

answer_05 = guess;
```

The user needs to verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_05_whatsThePassword',answer_05, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_06_aLongPass

fcn_CodeX_06_aLongPass: In this assignment, like the previous assignment, the user needs to find the integer password, but the password length is eight digits. The function returns **true** if the user guesses the correct integer password and returns **false** otherwise. The best way to solve this assignment is by using  **Vectorization**. Like the previous function, the user's guess is the third input argument.

**Note**: Instead of inputting a single integer, input a vector as your third argument.

```Matlab
entry_key = 'RGRGtub768^%$@*~ `'
student_number = 10;

%Vectorization
guesses = [1; 2; 3; 7];
true_false = fcn_CodeX_06_aLongPass(entry_key,student_number,guesses);,  

% The results, for this example, would give:

true_false = [0; 0; 1; 0];
  
% So the answer, in this example is 3:

answer_06 = 3;

```

The user needs to verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_06_aLongPass',answer_06, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_07_thatsOdd

In this assignment, the function generates a vector of 10,000 integers as a N x 1 matrix. The user should return a vector of zeroes and ones as a 10,000 x 1 matrix. If an integer is odd, the user should return one; and if an integer is even, the user should return zero.

```Matlab
entry_key = 'jdcjcbbdhe&^#E(@77773!!)'
student_number = 10;

some_odd_numbers = fcn_CodeX_07_thatsOdd(entry_key,student_number);,

some_odd_numbers =
   
       11
       2
       8
       3
       5 
      (etc)

%User answer should be

answer_07 = 
  
       1
       0
       0
       1
       1 
      (etc)
  
```

The user needs to verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_07_thatsOdd',answer_07, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_08_RedLightGreenLight

This assignment pays homage to the very famous children's game called "Red Light, Green Light". As upcoming assignments will show, this game is also very relevant to capitalism! For more instructions about the game, [click here](https://www.playworks.org/game-library/red-light-green-light/).

In this assignment, the function returns three output arguments and it takes in three input arguments.

**Input Arguments**: The important input argument is "move_command". The player's position is dependent on the move command. The usage of move_command is discussed in the following paragraphs.

**Output Arguments**: The function returns light signal status, player position and answer_08 (Code String).

```Matlab
%This returns only light signal status

entry_key = '(788$#@##vvbGJ ~';
student_number = 10;

light_signal = fcn_CodeX_08_RedLightGreenLight(entry_key,student_number);
```

*light signal status*: It shows the status of the light signal. If light turns red, it outputs a zero '0' and if the light turns green, it outputs a one '1'. If the previous reading is "green", the user is allowed to move
by inserting a non-zero move command.

```Matlab
 move_command = 1;

[light_signal_status, player_position, answer_08] = fcn_CodeX_08_RedLightGreenLight(entry_key,student_number,move_command);
```

*player position*: The function will advance the palyer forward by 1 (as per the example above) and prints the player's position.

But if the light is "red" during a move command, then the player has to go back to the start line and the player's position is set back to zero. The finish line is set at 1000 steps.

*answer_08*: This returns a string value once the player crosses 1000 steps. This string value can be used to verify the answer of this assignment.

```Matlab
%Algorithm

if light signal status is red
           ---> Don't move
           ---> move command should be zero
if light signal status is green
           ---> move
           ---> move command should be some positive value
if finish line is crossed (1000 steps)
          ---> Code string is returned in the third argument
---> Use the code (answer_08) to verify the answer       
```

The user needs to verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCodeX('fcn_CodeX_08_RedLightGreenLight', answer_08, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_09_ToTheTopOfTheMountain

This assignment is a modification of the previous assignment. The function returns a signal continuously. The behavior of the signal is detailed below. The user goal is to find the point (highest peak) at which output is no longer increasing.

```Matlab
entry_key = 'Ytte#$*)!!~`HGJAN ';
student_number = 10;

% This function returns signal

climb_height = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number);
```

This signal will increase, and then decrease at some point, and then increase, and then decrease, etc. The goal is to identify the number that is the most immediate highest number (highest_peak) after it starts to decrease. Because the "climb_height" may randomly start to increase again, it is important to identify the number quickly - otherwise the answer will change! To find the answer the user needs to input the highest_input as the third input argument as shown below.

```Matlab
entry_key = 'Ytte#$*)!!~`HGJAN ';
student_number = 10;

[climb_height, answer_09] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number,highest_peak);
```

The answer variable (answer_09) will be returned as empty until the "highest_peak" is correctly entered. The answer variable returns a code string if the "highest_peak" is correctly entered. The user needs to verify the answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCode('fcn_CodeX_09_ToTheTopOfTheMountain', answer_09, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CodeX_10_BuyLowSellHigh

In this assignment, the user participates in a virtual stock market to turn a $1 investment into $1000. The core algorithm the stock market is nearly identical to the child's game of red-light/green-light! This function has four output arguments and three input arguments

 ```Matlab
 entry_key = 'bANTc%H^E&S)9%E';
 student_number = 10;
 
 [current_market_index, current_investment_value, current_money_available_to_invest, answer_10] = ...
    fcn_CodeX_10_BuyLowSellHigh(entry_key,student_number,investment_in_or_out);
 ```

*current_market_index*: This signal will randomly increase, and then decrease at some point, and then increase, and then decrease, etc. This signal simulates the stock market. The user needs to observe the signal and invest when the market (current_market_index) is the most immediate lowest. The user needs to withdraw money when the market (current_market_index) is the most immediate highest. How to invest and withdraw money? The process is explained below.

*current_investment_value*: This is how much is invested in the market currently. When the function starts, this is just $1.

*current_money_available_to_invest*: This is how much is NOT invested presently (available to invest), e.g. "out" of the market. When the function starts, this is $0.

*investment_in_or_out*: This variable is used to invest or withdraw money from the account. The user cannot take out more money than is in the investment (initially $1) - (current_investment_value = 1), and cannot invest more money than is out of the investment currently (initially $0) - (current_money_available_to_invest = 0).

* "investment_in_or_out = positive number" means that the money is being invested into the market. In simple terms, this means buying the stocks.

**Note**: This "positive number" cannot be greater than the money current_money_availble_to_invest.

* "investment_in_or_out = negative number" means that the money is being removed from the market.In simple terms, this means selling the stocks.

**Note**: This "negative number" cannot be greater than the money ( - current_investment_value).

As in all the assignments, the user needs to verify answer using fcn_GradeCodeX.

```Matlab
fcn_GradeCode('fcn_CodeX_10_BuyLowSellHigh', answer_10, student_number);
```

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

### CoordX Functions

#### fcn_CoordX_01_Translation

In this assignment, you are given
N points in [x,y] that are randomly normal generated and a translation_vector. The user must translate the random points using the translation vector and find the closest point to the origin after translating the points. The answer to this exercise is the row_index of the closest point to the origin after applying the translation.

How to translate the points?

You have to create the transformation matrix.
  
```MATLAB
(tx, ty) = translation_vector;  % Given 

transformation_matrix = [1 0 tx; 0 1 ty; 0 0 1];

homogenous_random_points = [random_points ones(length(random_points),1)];

moved_points = (transformation_matrix*homogenous_random_points')' 

% " ' "  --  Transpose of a matrix 
```

This function has two output arguments and two input arguments.

```Matlab
entry_key = '76MgyEkSSkl!k8767I=89@#';
student_number = 10;

[random_points, translation_vector] = fcn_CoordX_01_Translation(entry_key, student_number);

answer_01 = % The answer to this exercise is the row_index of the closest point to the origin after applying the translation
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_01_Translation',answer_01, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_02_Rotation

In this assignment, you are given N points in [x,y] that are randomly normal generated and an angle (theta value) in degrees. The user must rotate the random points using given theta and find the index of the maximum x-value after rotating the points. The answer to this excercise is the row_index of the rotated point with the largest x-value.

How to rotate the points?

You have to create the transformation matrix.
  
```MATLAB
transformation_matrix = eye(3)

transformation_matrix(1,1) = cos(theta); 
transformation_matrix(1,2) = -sin(theta); 
transformation_matrix(2,1) = sin(theta);
transformation_matrix(2,2) = cos(theta);

homogenous_random_points = [random_points ones(length(random_points),1)];

moved_points = (transformation_matrix*homogenous_random_points')' 

% " ' "  --  Transpose of a matrix 
```

This function has two output arguments and two input arguments.

```Matlab
entry_key = '#$**MgSSklIk=76777';
student_number = 10;

[random_points, theta] = fcn_CoordX_02_Rotation(entry_key, student_number);

answer_02 = % The answer to this excercise is the row_index of the rotated point with the largest x-value
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_02_Rotation',answer_02, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_03_practiceRegression

In this assignment, you are given the x and y coordinates of N points that are randomly normal generated. The y values are generated from - y = mx + b + noise. The user needs to fit the noisy data using regression techniques. The answer to this excercise is the predicted values (y_pred) of noisy data after fitting the data

How to fit the points?

The points can be fit using Least Squares Method. An example to fit points in y = mx is shown below. 
   

```MATLAB
% Let there be 100 random points

Npoints = 100;

random_points = randn(Npoints,2);

x_data = random_points(:,1);
y_data = random_points(:,2);
```
The user must find the slope (m) to fit these points. Generally, if
y and x values are scalars, m can be determined easily -- m = y/x.
However, in this exercise, x and y are column vectors. Since it is not
straightforward to divide the vectors, the least squares method is used
in this case.

```MATLAB
%Representing the column vectors in capital letters
 
Y = Xm;

%X'Y = X'Xm - To solve this in MATLAB

% " ' "  --  Transpose of a matrix

%((X'Y)(X'X)^-1) = m 

% m = A\B (solves the linear system A*m = B (for m))

m =  X'*X \ X'*Y; 
```
This is a better way to divide as this method follows the row echelon method to find the "m".

However, to fit y = mx + b 

```MATLAB
[x 1]*[m; b] = y
```
This function has two output arguments and two input arguments.

```Matlab
entry_key = '100011Tt`~MESS!*&* &';
student_number = 10;

[x_data, y_noisy] = fcn_CoordX_03_practiceRegression(entry_key, student_number);

answer_03 = % The answer to this excercise is the predicted values (y_pred) of noisy data after fitting the data
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_03_practiceRegression',answer_03, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_04_practiceScaling

In this assignment, you are given N points in [x,y] that are randomly normal generated and a scaling parameter (S value). The user must scale the random points using the given S and find the index of the maximum y-value after scaling the points. The answer to this exercise is the row_index of the scaled point with the largest y-value.

How to scale the points?

You have to create the transformation matrix.
  
```MATLAB
transformation_matrix = eye(3)

transformation_matrix(1,1) = S; 
transformation_matrix(2,2) = S;

homogenous_random_points = [random_points ones(length(random_points),1)];

moved_points = (transformation_matrix*homogenous_random_points')' 

% " ' "  --  Transpose of a matrix 
```

This function has two output arguments and two input arguments.

```Matlab
entry_key = 'hhgd^&R76(*#MeSSkjjI87*$$)';
student_number = 10;

[random_points, S] = fcn_CoordX_04_practiceScaling(entry_key, student_number);

answer_04 = % The answer to this exercise is the row_index of the scaled point with the largest y-value
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_04_practiceScaling',answer_04, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_05_findScalingParameter

In this assignment, you are given N points in [x,y] that are randomly normal generated and noisy points. The noisy points are created by scaling the random points and then adding the noise to the scaled points. The user must find the scaling parameter that is used to transform random points into noisy
points. The following function can be used to solve this assignment. 

```MATLAB
S_calculated = 
fcn_AlignCoords_regressionFitScaleFactor(random_points, noisy_points)
```

Note: Only the first two columns of random and noisy points must be
used as the input arguments of the above function. A user should not
use Homogeneous points as the input arguments

Homogenous points: Z - coordinates of the randomly generated points should be '1'

The function "fcn_CoordX_05_findScalingParameter" has two output arguments and two input arguments.

```Matlab
entry_key = 'ME10!!SSII&h33EST';
student_number = 10;

[random_points, noisy_points] = fcn_CoordX_05_findScalingParameter(entry_key, student_number);

answer_05 = % The answer to this exercise is the S_calculated (scaling parameter) that scales random points to noisy points
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_05_findScalingParameter',answer_05, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_06_produce2DHomogeneousTranformMatrix

In this assignment, you are given S (scaling parameter), theta, tx, ty and
order_string. The user must generate a 2D homogeneous
transform matrix using the function below.

```MATLAB
T_calculated = fcn_AlignCoords_generate2DTransformMatrix(S, theta, tx, ty, order_string);
```
Supppose, 

order_string = 'rts' - generate the transformation matrix for rotating,
translating and scaling the points, correspondingly.

order_string = 'tsr' - generate the transformation matrix for translating, scaling and rotating the points, correspondingly.


The function "fcn_CoordX_06_produce2DHomogeneousTranformMatrix" has five output arguments and two input arguments.

```Matlab
entry_key = 'W#0s7hEb3$TT - `m3$$!`';
student_number = 10;

[S, theta, tx, ty, order_string] = fcn_CoordX_06_produce2DHomogeneousTranformMatrix(entry_key, student_number);

answer_06 = % The answer to this exercise is the transformation matrix of the given order_string
```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_06_produce2DHomogeneousTranformMatrix',answer_06, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_07_practiceKabschsAlgorithm

In this assignment, you are given N points in [x,y] that are randomly normal generated and
the corresponding transformed points. The transformed points are the
matching set of points which are the rotated and translated version of
these points. The user must find the homogeneous transform matrix that
fits the points each other. The following function can be used to
perform the Kabsch's algorithm for finding the 2D homogeneous transform
matrix

```MATLAB
[R_calculated,t_rotated,~] = fcn_AlignCoords_fitRotationKabsch(random_points,moved_points);
```
```MATLAB
t_calulated = -(t_rotated/R_calculated)';

% " ' "  --  Transpose of a matrix
```

R_calulated is the rotation vector, and t_calculated is the translation vector. 

Note: Only the first two columns of random and moved points must be used as the input arguments of the above function. A user should not use Homogeneous points as the input arguments.

The function "fcn_CoordX_07_practiceKabschsAlgorithm" has two output arguments and two input arguments.

```Matlab
entry_key = 'm3S$!-I$ 7#3_w0rl5*c#@m|)!0nn';
student_number = 10;

[random_points, moved_points] = fcn_CoordX_07_practiceKabschsAlgorithm(entry_key, student_number);

answer_07 = ;% The answer to this exercise is the 2D homogeneous-form transform matrix that fits the points each other

```

After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_07_practiceKabschsAlgorithm',answer_07, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_08_findHomogeneousTransformMatrix

In this assignment, you are given N points in [x,y] that are randomly normal generated and the corresponding transformed points. The transformed points are the matching set of points which are the scaled, rotated and translated version of these points. The user must find the homogeneous transform matrix that fits the points each other. The following function can be used to for finding the 2D homogeneous transform matrix. In the previous assignment, the random points are not scaled however, in this assignment, the random points are scaled, rotated and translated.

```MATLAB
[T_calculated,~,~,~,~] = fcn_AlignCoords_fit2DCoordinates(random_points,moved_points);
```
Note: Only the first two columns of random and moved points must be used as the input arguments of the above function. A user should not use Homogeneous points as the input arguments.

The function "fcn_CoordX_08_findHomogeneousTransformMatrix" has two output arguments and two input arguments.

```Matlab
entry_key = ')((*&^^%m3S$!dhusgd)fj)*&&*^';
student_number = 10;

[random_points, moved_points] = fcn_CoordX_08_findHomogeneousTransformMatrix(entry_key, student_number);

answer_08 = ;% The answer to this exercise is the 2D homogeneous-form transform matrix that fits the points each other
```
After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_08_findHomogeneousTransformMatrix',answer_08, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

#### fcn_CoordX_09_findAffineTransformMatrix

In this assignment, you are given N points in [x,y] that are randomly normal generated and the corresponding transformed points. The transformed points are the matching set of points which are the skewed, scaled, rotated and translated version of these points. The user must find the homogeneous transform matrix that fits the points each other. The following function can be used to for finding the 2D homogeneous transform matrix. In the previous assignment, the random points are not scaled however, in this assignment, the random points are skewed, scaled, rotated and translated.

```MATLAB
[T_calculated,~] = fcn_AlignCoords_fitAffineXform(random_points moved_points);
```
Note: Only the first two columns of random and moved points must be used as the input arguments of the above function. A user should not use Homogeneous points as the input arguments.

The function "fcn_CoordX_09_findAffineTransformMatrix" has two output arguments and two input arguments.

```Matlab
entry_key = ')((*&^^%m3S$!dhusgd)fj)*&&*^';
student_number = 10;

[random_points, moved_points] = fcn_CoordX_09_findAffineTransformMatrix(entry_key, student_number);

answer_09 = ;% The answer to this exercise is the 2D homogeneous-form transform matrix that fits the points each other
```
After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCoordX.

```Matlab
student_number = 10;

fcn_GradeCoordX('fcn_CoordX_09_findAffineTransformMatrix',answer_09, student_number);
```

If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- USAGE EXAMPLES -->
## Usage
<!-- Use this space to show useful examples of how a project can be used.
Additional screenshots, code examples and demos work well in this space. You may
also link to more resources. -->

### Examples

1. “help (FunctionName)” displays the instructions for the corresponding assignment

   ```Matlab
   help fcn_CodeX_01_getKey
   ```

   This displays the instructions of the first assignment.

2. To solve an assignment,  Answer = FunctionName(corresponding function’s entry key, student number you entered)

   ```Matlab
   answer = fcn_CodeX_01_getKey(entry_key,student_number);
   ```

3. After solving each assignment, the user must check the answer using fcn_GradeCodeX('FunctionName', Answer, student number you entered)

   ```Matlab
   fcn_GradeCodeX('fcn_CodeX_01_getKey',answer, student_number); 
   ```

If the answer is correct, the command window displays the following function (new assignment), and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- USAGE EXAMPLES -->
## Usage
<!-- Use this space to show useful examples of how a project can be used.
Additional screenshots, code examples and demos work well in this space. You may
also link to more resources. -->

### Examples

1. “help (FunctionName)” displays the instructions for the corresponding assignment

   ```Matlab
   help fcn_CodeX_01_getKey
   ```

   This displays the instructions of the first assignment.

2. To solve an assignment,  Answer = FunctionName(corresponding function’s entry key, student number you entered)

   ```Matlab
   answer = fcn_CodeX_01_getKey(entry_key,student_number);
   ```

3. After solving each assignment, the user must check the answer using fcn_GradeCodeX('FunctionName', Answer, student number you entered)

   ```Matlab
   fcn_GradeCodeX('fcn_CodeX_01_getKey',answer, student_number); 
   ```

If the answer is correct, the command window displays the following function (new assignment), and if the answer is wrong, the command window displays that “the answer was wrong, try again”.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- CONTACT -->
## Contact

Sean Brennan - sbrennan@psu.edu

Aneesh Batchu - abb6486@psu.edu

Project Link: [https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises](https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises)

<a href="#errata_tutorials_codeexercises">Back to top</a>

***

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
