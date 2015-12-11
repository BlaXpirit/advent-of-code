from pathlib import Path


inp = Path('input.txt').read_text().strip()

pos = 0
visited = {pos}

for c in inp:
    pos += {'<': -1, '^': -1j, '>': 1, 'v': 1j}[c]
    visited.add(pos)

print(len(visited))
