Prototypes tell the compiler about a function.
Definitions tell the compiler about the function's operation.

__Syntax:__
```c
functionType functionName(argument)
{
	local variable declarations
	executable statements
}
```
__Example:__
```c
void print_h(void)
{
	printf("** **\n");
	printf("** **\n");
	printf("*****\n");
	printf("** **\n");
	printf("** **\n");
}
```
__Explanation:__
Much like the [[function prototypes]] the return type, name and arguments are specified.
The "executable statements" inside the function are what the function will process when it is called.
__NOTE:__ any variables declared inside the function are only initialised when the function is called, 
and are not accessible outside of the function.
It is also important to note that functions declaration order is not strict, but the order in which they are called can drastically impact the final output of the code. 

## Defining a function with input arguments and a single result
__Syntax:__
```c
functionType functionName(formal parameter declaration list)
{
	local variable declarations
	executable statements
}
```
__Example:__
```c
int cube(int n)
{
	return (n * n * n);
}
```
__Explanation:__
Notice that in the above example the function type is the same as the return type.
Execution of a __return__ statement will return control back to the function that called it, so in cases 
where multiple return calls are made (when they meet different conditions) then the function will 
not continue executing the executable statements.

## Defining functions with multiple arguments
In a function with more than one argument each passed argument (([[actual argument]])) will 
correspond to a [[formal parameter]].
__Example:__
```c
int rect_area(int sideOne, int sideTwo)
{
	return (sideOne * sideTwo);
}
```
If this function is called with the [[actual argument]]s of:
```c
int num1 = 5;
int num2 = 2;

rect_area(num1, num2)
```
Then the [[argument list correspondence]] will be as follows:
[[actual argument]] `num1` corresponds to [[formal parameter]] `sideOne`.
[[actual argument]] `num2` corresponds to [[formal parameter]]  `sideTwo`