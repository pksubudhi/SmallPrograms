# Basic Understanding of for loop in Python


#Output: 1 to 9 (with newline)
for i in range(1, 10):
    print(i)

print("\n")

#Output: 1 to 10 (with newline)
for i in range(1, 11):
    print(i)
print("\n")

#Output: 1 to 10 (with new line where n is used)
n=11
for i in range(1, n):
    print(i)
print("\n")

#Output: 1, 5, , 9, 13, 17 (with new line step 4)
for i in range(1, 20, 4):
    print(i)
print("\n")

#Output: All characters in the string
for i in "world":
    print(i)
print("\n")

#Output: All words in the array
x = ["rose", "tulip", "lily", "jasmine"]
for i in x:
    print(i)
print("\n")

#Output: 1 to n side by side
n=10
for i in range(n):
   print(i,end=" ")
print("\n")

n=10
for i in range(n):
   print(i,end=", ")
print("\n")

