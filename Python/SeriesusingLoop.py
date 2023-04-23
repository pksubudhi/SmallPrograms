#WAP to display the following series
# 1 5 11 19 29 for n values where n is user input

n = int(input("Enter an integer: "))
for i in range(1, n+1):
    print((i*i)+(i-1), end=" ")
