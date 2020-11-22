#! /usr/local/bin/python3

import random

def ndx(n: int, x: int, keep: int = 0) -> int:
    if ((keep > n ) or (keep < 0)):
        raise ValueError("Can't keep more dice than rolled")
    results = sorted([random.randint(1,x) for _ in range(n)], reverse=True)
    if keep:
        results = results[:keep]
    return (results, sum(results))


def roll_abilities(method: int = 1, num: int = 6) -> list:
    if method not in range(1,7):
        raise ValueError("Rolling method must be between 1 and 6)")
    if method in (1,3):
        # Method 1 is just Method 3 without arranging...
        rolls = [ndx(3,6)[1] for _ in range(num)]
    if method in (2,4):
        # Again, 2 is just 4 without arranging...
        # All we do is roll 3d6 twice and pick higher
        rolls = [max(ndx(3,6)[1],ndx(3,6)[1]) for _ in range(num)]
    if method == 5:
        rolls = [ndx(4,6,keep=3)[1] for _ in range(num)]
    if method == 6:
        # 6 is literally just 6d6.
        rolls = [ndx(1,6)[1] for _ in range(num)]

    if method >2:
        rolls = sorted(rolls, reverse=True)
    return rolls

if __name__ == "__main__":
    print(ndx(1,6))
