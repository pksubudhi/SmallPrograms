def main():
    count = 0
    y = 0
    for n in range(2, 1000):
        y = 0
        for i in range(2, int(n/2)+1):
            
            if n%i == 0:
                y = y + 1
        if y == 0:
           count = count + 1
    print(f"There are {count} prime numbers")
main()
