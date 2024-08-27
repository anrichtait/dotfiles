When using multiple argument functions it is important to make sure that the correct number of 
arguments are passed to the function and their order must also correspond to the [[formal parameter]] 
list in the function prototype or heading.

Also keep in mind that while passing an int to a double type function is okay, this is not the case 
for all data type. (double to int will cause loss of the fractional value for example)

This can be summed up in the following:
- __number__ of actual arguments used in a call to the function must be the same as the [[formal parameter]] list
- __order__ of arguments determines correspondence.
- __type__ of the argument must be a type that can be assigned without losing any information.

__OR__

- N - number
- O - order
- T - type
__For short__