

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
    This code is developed to test the basics of your coding skills in MATLAB. 
    <br />
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/tree/main/Documents">View Demo</a>
    ·
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/issues">Report Bug</a>
    ·
    <a href="https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/issues">Request Feature</a>
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
    <li><a href="#repo-structure">Repo Structure</a>
	    <ul>
	    <li><a href="#directories">Top-Level Directories</li>
	    <li><a href="#dependencies">Dependencies</li>
	    <li><a href="#functions">Functions</li>
	    </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
	    <ul>
	    <li><a href="#examples">Examples</li>
	    </ul>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Code Exercises

<!--[![Product Name Screen Shot][product-screenshot]](https://example.com)-->

There are ten functions in this repo. Each function represents a coding exercise. The level of difficulty increases with the coding exercises. The first one is as simple as just entering a number, and in the last one, the user needs to earn money by investing a dollar in a stock market simulation. Users can only see two assignments (functions) and the corresponding "entry key" simultaneously. An entry key is a unique passcode; the user must enter it to solve a particular problem. Whenever a user restarts the program, the code generates new entry keys to all the functions. The user must start solving from the first assignment. A user can unlock the next assignment only if the answer to the current assignment is correct. The usage of this repo is detailed in the "Usage" section below.

<!-- GETTING STARTED -->
## Getting Started

To start the coding exercise, follow the steps below.

### Installation

1.  Paste “fcn_GradeCodeX.p” file in a new directory on your machine and open it.

2. It creates a Utility folder within the directory and asks you to enter your ‘student number’ in the command window. 

3. Enter a number in the command window. It checks all 10 code dependencies and displays the first two functions. 

4. Start solving the coding exercises. Only two exercises and the corresponding entry keys are displayed in the command window. The user must solve the current assignment to enter the next assignment. For instance, the user must solve the first exercise to solve the second exercise.


<!-- STRUCTURE OF THE REPO -->
## Repo Structure

### Directories
The following are the top level directories within the repository: 

**NEEDS TO BE UPDATED**

### Dependencies

**NEEDS TO BE UPDATED**

<!-- FUNCTION DEFINITIONS -->
### Functions

**Coding Assignments**

1. fcn_CodeX_01_getKey: In this assignment, the user needs to input an entry key and a student number. The answer for this assignment is just a single line of code. This function helps the user to understand how to use an entry key to solve the assignment. For instance, if an entry key of this function is 'jdf83u8jd` 8' and student number of the user is 25

```sh
entry_key = 'jdf83u8jd` 8';
student_number = 25;

answer = fcn_CodeX_01_getKey(entry_key, student_number);
```
After solving each assignment, the user must verify the answer to proceed further. The user can verify the answer using fcn_GradeCodeX.

```sh
student_number = 25;

fcn_GradeCodeX('fcn_CodeX_01_getKey',answer, student_number);
```
If the answer is correct, the command window displays a new assignment, and if the answer is wrong, the command window displays that “the answer was wrong, try again”. 

2. fcn_CodeX_02_whatsYourNumber: In this assignment, the user needs to find the user's student number from a list of numbers and should return the index (row) of the student number. Unlike the previous function, this function generates a list of numbers. The answer to this assignment is the row number of the user's student number. For example, if the user's student number is 25. The "fcn_CodeX_02_whatsYourNumber" generates a list of numbers, and 25 would be one of the numbers. The user should find the row where 25 is located.

```sh
entry_key = '!)ehf%6kjf fif';
student_number = 25;

result_02_list = fcn_CodeX_02_whatsYourNumber(entry_key,student_number);

answer_02 = ; %write a code to find row number where student number is located
```
Similarly, user should verify the answer using fcn_GradeCodeX. 

```sh
fcn_GradeCodeX('fcn_CodeX_02_whatsYourNumber',answer_02, student_number);
```

3. fcn_CodeX_03_headsOrTails: In this assignment, the user needs to return a vector of zeroes and ones from a random row vector (50 elements) composed of values between 0 to 1. If the value is less than 0.5, the user should return 0 (tails); if the value is greater than 0.5, the user should return 1 (heads). This function generates a random vector of 50 elements. For example,

```sh
entry_key = '^&*877bHKK***2jbhd u&((**)0)';
student_number = 25;

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
```sh
fcn_GradeCodeX('fcn_CodeX_03_headsOrTails',answer_03, student_number);
```
4. fcn_CodeX_04_doubleOrNothing: In this assignment, the function returns a random vector of 50 numbers. The user needs to find the number that is **exactly** twice as big as one of the other 49 numbers and should return the row of the **double** number. For example,

```sh
entry_key = 'ABCD$%^&TTT hdghgh`~`~';
student_number = 25;

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
```sh
fcn_GradeCodeX('fcn_CodeX_04_doubleOrNothing',answer_04, student_number);
```
5. fcn_CodeX_05_whatsThePassword: In this assignment, the function returns **true** if the user guesses the correct integer password and returns **false** otherwise. The range of password is 0-9. Unlike the previous functions, this function can take three input arguments. The user's guess is the third input argument.

```sh
entry_key = ' ^&^*^#^djhAHYBj $643gv';  
student_number = 25; 

guess = 2; %Varies from 0 to 9
true_false = fcn_CodeX_05_whatsThePassword(entry_key,student_number,guess);

%for correct password

answer_05 = guess;
```
The user needs to verify the answer using fcn_GradeCodeX. 

```sh
fcn_GradeCodeX('fcn_CodeX_05_whatsThePassword',answer_05, student_number);
```
6. fcn_CodeX_06_aLongPass: In this assignment, like the previous assignment, the user needs to find the integer password, but the password length is eight digits. The function returns **true** if the user guesses the correct integer password and returns **false** otherwise. The best way to solve this assignment is by using  **Vectorization**. Like the previous function, the user's guess is the third input argument.

**Note**: Instead of inputting a single integer, input a vector as your third argument.

```sh
entry_key = 'RGRGtub768^%$@*~ `'
student_number = 25;

%Vectorization
guesses = [1; 2; 3; 7];
true_false = fcn_CodeX_06_aLongPass(entry_key,student_number,guesses);,  

% The results, for this example, would give:

true_false = [0; 0; 1; 0];
  
% So the answer, in this example is 3:

answer_06 = 3;

```
The user needs to verify the answer using fcn_GradeCodeX. 

```sh
fcn_GradeCodeX('fcn_CodeX_06_aLongPass',answer_06, student_number);
```
7. fcn_CodeX_07_thatsOdd: In this assignment, the function generates a vector of 10,000 integers as a N x 1 matrix. The user should return a vector of zeroes and ones as a 10,000 x 1 matrix. If an integer is odd, the user should return one; and if an integer is even, the user should return zero.

```sh
entry_key = 'jdcjcbbdhe&^#E(@77773!!)'
student_number = 25;

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

```sh
fcn_GradeCodeX('fcn_CodeX_07_thatsOdd',answer_07, student_number);
```
8. fcn_CodeX_08_RedLightGreenLight: This assignment pays homage to the very famous children's game called "Red Light, Green Light". As upcoming assignments will show, this game is also very relevant to capitalism! For more instructions about the game, [click here](https://www.playworks.org/game-library/red-light-green-light/).

In this assignment, the function returns three output arguments and it takes in three input arguments. 

**Input Arguments**: The important input argument is "move_command". The player's position is dependent on the move command. The usage of move_command is discussed in the following paragraphs.

**Output Arguments**: The function returns light signal status, player position and answer_08 (Code String).

```sh
%This returns only light signal status

entry_key = '(788$#@##vvbGJ ~';
student_number = 25;

light_signal = fcn_CodeX_08_RedLightGreenLight(entry_key,student_number);
```

*light signal status*: It shows the status of the light signal. If light turns red, it outputs a zero '0' and if the light turns green, it outputs a one '1'. If the previous reading is "green", the user is allowed to move
by inserting a non-zero move command.

```sh
 move_command = 1;

[light_signal_status, player_position, answer_08] = fcn_CodeX_08_RedLightGreenLight(entry_key,student_number,move_command);
```
*player position*: The function will advance the palyer forward by 1 (as per the example above) and prints the player's position. 

But if the light is "red" during a move command, then the player has to go back to the start line and the player's position is set back to zero. The finish line is set at 1000 steps.

*answer_08*: This returns a string value once the player crosses 1000 steps. This string value can be used to verify the answer of this assignment.

```sh
%Algorithm

if light signal status is red
           ---> Don't move
           ---> move command should be zero
if light signal status is green
           ---> move
           ---> move command should be some +ve value
if finish line is crossed (1000 steps)
          ---> Code string is returned in the third argument
---> Use the code (answer_08) to verify the answer       
```
The user needs to verify the answer using fcn_GradeCodeX. 

```sh
fcn_GradeCodeX('fcn_CodeX_08_RedLightGreenLight', answer_08, student_number);
```
9. fcn_CodeX_09_ToTheTopOfTheMountain: This assignment is a modification of the previous assignment. The function returns a signal continuously. The behavior of the signal is detailed below. The user goal is to find the point (highest peak) at which output is no longer increasing. 

```sh
entry_key = 'Ytte#$*)!!~`HGJAN ';
student_number = 25;

% This function returns signal

climb_height = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number);
```

This signal will increase, and then decrease at some point, and then increase, and then decrease, etc. The goal is to identify the number that is the most immediate highest number (highest_peak) after it starts to decrease. Because the "climb_height" may randomly start to increase again, it is important to identify the number quickly - otherwise the answer will change! To find the answer the user needs to input the highest_input as the third input argument as shown below.

```sh
entry_key = 'Ytte#$*)!!~`HGJAN ';
student_number = 25;

[climb_height, answer_09] = fcn_CodeX_09_ToTheTopOfTheMountain(entry_key,student_number,highest_peak);
```
The answer variable (answer_09) will be returned as empty until the "highest_peak" is correctly entered. The answer variable returns a code string if the "highest_peak" is correctly entered. The user needs to verify the answer using fcn_GradeCodeX.

```sh
fcn_GradeCode('fcn_CodeX_09_ToTheTopOfTheMountain', answer_09, student_number);
```
10. fcn_CodeX_10_BuyLowSellHigh: In this assignment, the user participates in a virtual stock market to turn a $1 investment into $1000. The core algorithm the stock market is nearly identical to the child's game of red-light/green-light! This function has four output arguments and three input arguments
 
 ```sh
 entry_key = 'bANTc%H^E&S)9%E';
 student_number = 25;
 
 [current_market_index, current_investment_value, current_money_available_to_invest, answer_10] = ...
    fcn_CodeX_10_BuyLowSellHigh(entry_key,student_number,investment_in_or_out);
 ```
*current_market_index*: This signal will randomly increase, and then decrease at some point, and then increase, and then decrease, etc. This signal simulates the stock market. The user needs to observe the signal and invest when the market (current_market_index) is the most immediate lowest. The user needs to withdraw money when the market (current_market_index) is the most immediate highest. How to invest and withdraw money? The process is explained below.

*current_investment_value*: This is how much is invested in the market currently. When the function starts, this is just $1.

*current_money_available_to_invest*: This is how much is NOT invested presently (available to invest), e.g. "out" of the market. When the function starts, this is $0.

*investment_in_or_out*: This variable is used to invest or withdraw money from the account. The user cannot take out more money than is in the investment (initially $1) - (current_investment_value = 1), and cannot invest more money than is out of the investment currently (initially $0) - (current_money_available_to_invest = 0). 

* "investment_in_or_out = +ve number" means that the money is being invested into the market. In simple terms, this means buying the stocks.

**Note**: This "+ve number" cannot be greater than the money current_money_availble_to_invest.

* "investment_in_or_out = -ve number" means that the money is being removed from the market.In simple terms, this means selling the stocks.

**Note**: This "-ve number" cannot be greater than the money ( - current_investment_value).

As in all the assignments, the user needs to verify answer using fcn_GradeCodeX. 

```sh
fcn_GradeCode('fcn_CodeX_10_BuyLowSellHigh', answer_10, student_number);
```

<!-- USAGE EXAMPLES -->
## Usage
<!-- Use this space to show useful examples of how a project can be used.
Additional screenshots, code examples and demos work well in this space. You may
also link to more resources. -->

### Examples

1. “help (FunctionName)” displays the instructions for the corresponding assignment

   ```sh
   help fcn_CodeX_01_getKey
   ```
   This displays the instructions of the first assignment.

2. To solve an assignment,  Answer = FunctionName(corresponding function’s entry key, student number you entered)

   ```sh
   answer = fcn_CodeX_01_getKey(entry_key,student_number);
   ```

3. After solving each assignment, the user must check the answer using fcn_GradeCodeX('FunctionName', Answer, student number you entered) 

   ```sh
   fcn_GradeCodeX('fcn_CodeX_01_getKey',answer, student_number); 
   ```

If the answer is correct, the command window displays the following function (new assignment), and if the answer is wrong, the command window displays that “the answer was wrong, try again”. 


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact
Sean Brennan - sbrennan@psu.edu

Project Link: [https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises](https://github.com/ivsg-psu/Errata_Tutorials_CodeExercises)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation.svg?style=for-the-badge
[contributors-url]: https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation.svg?style=for-the-badge
[forks-url]: https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/network/members
[stars-shield]: https://img.shields.io/github/stars/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation.svg?style=for-the-badge
[stars-url]: https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/stargazers
[issues-shield]: https://img.shields.io/github/issues/ivsg-psu/reFeatureExtraction_Association_PointToPointAssociationpo.svg?style=for-the-badge
[issues-url]: https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/issues
[license-shield]: https://img.shields.io/github/license/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation.svg?style=for-the-badge
[license-url]: https://github.com/ivsg-psu/FeatureExtraction_Association_PointToPointAssociation/blob/master/LICENSE.txt








