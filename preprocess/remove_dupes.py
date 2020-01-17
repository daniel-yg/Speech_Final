from sys import stdin
print('\n'.join(list(dict.fromkeys(stdin.read().split("\n")))))
