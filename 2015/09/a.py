from pathlib import Path
from itertools import permutations, tee
import re

def pairwise(iterable):
    a, b = tee(iterable)
    next(b, None)
    return zip(a, b)


inp = Path('input.txt').read_text()

distances = {}
locations = set()

for line in inp.splitlines():
    a, b, d = re.search('^(\w+) to (\w+) = ([0-9]+)$', line).groups()

    distances[frozenset([a, b])] = int(d)
    locations.add(a)
    locations.add(b)

print(min(
    sum(
        distances[frozenset(pair)]
        for pair in pairwise(perm)
    )
    for perm in permutations(locations)
))
