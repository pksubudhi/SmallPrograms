# To read a number from console we have to use input() function
# However, it returns the input value as a string
# To parse a string into integer, we can use int() function

x = int(input("Type an Integer: "))
if (x % 2) == 0:
    print(x, "is an Even Number")
else:
    print(x, "is an Odd Number")
