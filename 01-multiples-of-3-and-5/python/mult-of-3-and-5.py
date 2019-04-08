def is_mult_of_3_or_5(x):
    return ( ( x % 3 is 0 ) or ( x % 5 is 0 ) )

def main():
    mults_of_three_and_five = []
    for i in range(1000):
        if is_mult_of_3_or_5(i):
            mults_of_three_and_five.append(i)

    i = 1 
    for x in mults_of_three_and_five:
        print("{:4d},".format(x), end='')
        if i % 32 is 0:
            print()
        i+=1

main()

