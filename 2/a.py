from pathlib import Path


inp = Path('input.txt').read_text()

total = 0
for line in inp.splitlines():
    a, b, c = map(int, line.split('x'))
    sides = [a*b, b*c, c*a]
    total += sum(sides)*2 + min(sides)

print(total)
