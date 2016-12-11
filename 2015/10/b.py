from pathlib import Path
from itertools import groupby


inp = Path('input.txt').read_text().strip()

for _ in range(50):
    inp = ''.join(
        str(len(list(group))) + key
        for key, group in groupby(inp)
    )

print(len(inp))
