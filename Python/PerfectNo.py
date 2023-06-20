def main():
    sum = 1
    n = int(input("Enter a number: "))
    for i in range(2, int(n/2) + 1):
        if n%i == 0:
            sum += i
    print("sum is " + str(sum))
    if sum == n:
        print("Perfect")
    else:
        print("Not Perfect")
main()
