A function prototype can either be declared in a header file that get's included in a program's source code, or it can be declared in the main source code.

In either case the prototype must be declared before the main function.

The function prototype tells the compiler three things:
1. the data type: determined by the type of value returned.
2. the function name
3. arguments

__Syntax:__
```c
functionType functionName(arguments);
```
__Example:__
```c
void print_hello(void);
```
__Explanation:__
- functionType: means the function won't return a value
- functionName: what name the function will be called with
- (arguments): what arguments the function takes

Function prototypes only tell the compiler about a function's main attributes, not it's process.
For that we need to create [[function definitions]].