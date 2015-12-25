from pathlib import Path

with Path('input.txt').open() as f:
    field = {
        (x, y)
        for y, line in enumerate(f)
        for x, c in enumerate(line.strip())
        if c == '#'
    }

for _ in range(100):
    field = {
        (x, y)
        for y in range(100)
        for x in range(100)
        if sum(
            (i, j) in field
            for j in range(y-1, y+2)
            for i in range(x-1, x+2)
            if (i, j) != (x, y)
        ) in (
            [2, 3] if (x, y) in field else [3]
        )
    }

print(len(field))
