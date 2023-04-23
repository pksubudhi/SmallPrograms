# Write a program to calculate factorial of an input integer

n = int(input("Enter an integer: "))
x = 1
for i in range(n, 1, -1):
    x *= i
print("Factorial is", x)
