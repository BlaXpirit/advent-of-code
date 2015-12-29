from pathlib import Path

w = h = 100

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
        for y in range(h)
        for x in range(w)
        if sum(
            (i, j) in field
            for j in range(y-1, y+2)
            for i in range(x-1, x+2)
            if (i, j) != (x, y)
        ) in (
            [2, 3] if (x, y) in field else [3]
        )
    } | {(0, 0), (w-1, 0), (0, h-1), (w-1, h-1)}

print(len(field))
