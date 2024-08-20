The arguments of a function provide a way to supply information for processing.
There are two kinds of function arguments:
1. __input arguments:__ carry information into a function
2. __output arguments:__ return a result

## void Functions with Input arguments:
Recall that a void function does not return a result. In this case we can use the argument in 
the program's output instead of in a __return__ call.

__Example:__
```c
void print_rand_num(double rnum)
{
	printf("%7.2f\n", rnum);
}
```
When the function is called the value of it's [[actual argument]] (135.68) is passed to the function 
and is then substituted for it's [[formal parameter]] "rnum".

Related concepts:[[function prototypes]], [[function definitions]], [[Functions without arguments]]