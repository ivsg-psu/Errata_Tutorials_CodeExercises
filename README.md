

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

There are ten functions in this repo. Each function represents a coding exercises. The level of difficulty increases with the coding exercises. The first one is as simple as just entering a number, and in the last one, user needs to earn money by investing a dollar in a stock market simulation. Users can only see two assignments (functions) and the corresponding “entry key” simultaneously. An entry key is a unique passcode a user needs to enter to solve a particular problem. Every time a user restarts the program, the code generates new entry keys to all the functions. The user must start solving from the first assignment. A user can unlock the next assignment only if the answer of the current assignment is correct. The usage of this repo is detailed in the “Usage” section below. 

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

### Dependencies

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
entry_key = '!)ehf%6kjf fif'
student_number = 25;

result_02_list = fcn_CodeX_02_whatsYourNumber(entry_key,student_number);

answer_02 = ; %write a code to find row number where student number is located
```
Similarly, user should verify the answer using fcn_GradeCodeX. In this assignment

```sh
fcn_GradeCodeX('fcn_CodeX_02_whatsYourNumber',answer_02, student_number);
```

3. fcn_CodeX_03_headsOrTails: 

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








