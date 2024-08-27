# How to use these notes:
- create a heading for each new concept
- create linked atomic notes for each sub concept under the heading 
- after going through a concept reading and note writing, give the concept a brief summary and own code example if possible

# Functions:
Functions break large computing tasks into smaller ones. This is good for a couple reasons:
1. It makes the code easier to understand when each function has one specific task it needs
   to achieve.
2. Code is easier to re-use in other parts of the program.
3. If one function breaks it is easier to diagnose and fix.
4. Re-using already tried and tested functions helps ensure that code remains error free.

Functions can be split into two categories:
1. [[Functions without arguments]]
2. [[Functions with arguments]]



## C Library functions:
The C standard library has a large amount of functions a programmer can use, these 
functions are accessed by adding their corresponding header file at the top of the 
program.
Example:
```c
#include <stdio.h>  --standard input and output
#include <math.h>   --tons of useful math related functions
```
__For reference:__ [[useful_functions]]

## Personal functions:
Apart from the C library you can also write your own functions.
These functions can be stored in a header file or in the main program file.
__NOTE__ when writing your own functions the [[function prototypes]] must be declared before 
the main function.

