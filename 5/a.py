from itertools import groupby
from pathlib import Path


inp = Path('input.txt').read_text()

vowels = set('aeiou')
nope = 'ab cd pq xy'.split()

print(sum(
    (
        sum(c in vowels for c in line) >= 3 and
        len(list(groupby(line))) < len(line) and
        not any(s in line for s in nope)
    )
    for line in inp.splitlines()
))
