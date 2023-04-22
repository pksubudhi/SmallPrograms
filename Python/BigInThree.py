# If you have more than 2 numbers then you cantake another temp (or dummy)
# variable to examine each other number to find out the biggest

x = 23
y = 10
z = 17
b = x
print("Numbers are", x, y, z)
if y > b:
    b = y
if z > b:
    b = z
print("The bigger one is ", b)
