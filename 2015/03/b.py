from pathlib import Path


inp = Path('input.txt').read_text().strip()

pos = [0, 0]
visited = {0}

for i, c in enumerate(inp):
    i %= 2
    pos[i] += {'<': -1, '^': -1j, '>': 1, 'v': 1j}[c]
    visited.add(pos[i])

print(len(visited))
