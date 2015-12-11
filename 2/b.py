from itertools import combinations
from pathlib import Path


inp = Path('input.txt').read_text()

total = 0
for line in inp.splitlines():
    dims = [int(s) for s in line.split('x')]
    sides = [a*b for a, b in combinations(dims, 2)]
    total += sum(sides)*2 + min(sides)

print(total)
