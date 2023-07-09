def say_hello():
    print("Hello")
    return True

def say_hello_return_current(cur):
    print("Hello")
    return cur

def important_function_call():
    print("I need to be executed for the program")
    return True

# Question 1: Python has built in boolean data type
print(type(True)) # <class 'bool'>
print(type(False)) # <class 'bool'>
print(type(0)) # <class 'int'>

# Different data types can be converted to boolean type
print(bool(0)) # False
print(bool(0.0)) # False
print(bool("")) # False
print(bool("0")) # True
print(bool([])) # False
print(bool("Test")) # True
print(bool([1,2,3])) # True
print("------------------")
print(True and bool("Test")) # True
print("------------------")

# Question 2: Short circuited operators
# and, or operators
print(True or say_hello()) # only the result "True" is printed and function is not called
print(False and say_hello()) # only the result "False" is printed and function is not called
print("------------------")

# Conditional operators
print(0 < -3 < 12) # Returns false after calculating first conditional (0 < -3)

# any(), all() functions
print(any(say_hello_return_current(cur) for cur in [False, True, False, False, False, True]))
print("------------------")
print(all(say_hello_return_current(cur) for cur in [False, True, False, False, False, True]))
print("------------------")


# Question 3: Short-circuit evaluation
# The print statement below returns:
# Hello
# True
print(False or say_hello_return_current(False) or True or say_hello_return_current(True) or say_hello_return_current(False))

print(1 < -5 < 12 > 7 < 2) # Returns false after calculating first conditional (0 < -3)

print("------------------")
print(all(say_hello_return_current(cur) for cur in [True, True, True, False, False, True]))
print("------------------")

# Question 4: Advantages of short-circuit evaluation
list = [1, 2, 3, 4, 5, 6]
count = 0

while count < len(list) and list[count] != 20:
    count = count + 1


# Question 5: disadvantages of short-circuit evaluation
first_bool = True
second_bool = False
flag = (first_bool and first_bool and second_bool and important_function_call())
print("------------------")
