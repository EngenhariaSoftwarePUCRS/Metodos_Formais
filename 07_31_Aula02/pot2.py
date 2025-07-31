def pot2(n):
    if (n == 0):
        return 1
    
    return 2 * pot2(n-1)

def main():
    m = pot2(4)
    print(m)

if __name__ == '__main__':
    main()
