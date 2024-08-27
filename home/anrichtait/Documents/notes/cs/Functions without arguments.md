_ In C it is very common to split your code into lots of smaller functions. A good rule is to have each function do a single very focused task. _

The most basic type of function is one that does not return a value and has no arguments.

## Calling a function that has no arguments:
__Syntax:__
```c
functionName();
```
__Example:__
```c
print_hello();

//where "print_hello();" is

void print_hello(void) {
	printf("Hello\n");
}
```
__Explanation:__
When a function that has no arguments is called it's code will be executed. While the code 
is being executed no other processes in the "caller" function will execute.

When the function has finished executing control will be passed back to the caller function.

Related concepts:[[function prototypes]], [[function definitions]], [[Functions with arguments]]