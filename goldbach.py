

def is_prime(a):
    for i in range(2, a):
        if a % i == 0:
            return 0

    return 1

a = input()
a = int(a)

for i in range(2, a):
    for j in range(2, a):
        if j > i and is_prime(j) == 1 and is_prime(i) == 1:
            if i + j == a:
                print(i, " ", j)
