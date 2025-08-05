def contains(a, x):
    for i in a:
        if i == x:
            return True
    
    return False

def main():
    a = [-3, 1, 7, -1, -1]
    x = 7
    result = contains(a, x)
    print(result)

if __name__ == "__main__":
    main()
