"""
1 + 1/2 + 1/3 +.....+ 1n
"""
def main():
    sum = 0
    n = int(input("Enter an integer: "))
    for i in range(1, n+1):
        
        x = 1/i
        sum = sum + x
    print(f"result is {sum}")
main()
