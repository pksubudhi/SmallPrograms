"""
1 + 1/(2)! + 1/(3)! +.....+ 1/(n)!
"""
def main():
    sum = 0
    n = int(input("Enter an integer: "))
    for i in range(1, n+1):
        fact = 1
        for j in range(1, i+1):
            fact =  fact * i
        x = 1/fact
        sum = sum + x
    print(f"result is {sum}")
main()
