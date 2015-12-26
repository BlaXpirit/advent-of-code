from pathlib import Path
import re

import numpy as np


inp = Path('input.txt').read_text()

grid = np.zeros((1000, 1000), np.bool)

for line in inp.splitlines():
    x1, y1, x2, y2 = map(int, re.findall(r'[0-9]+', line))
    if 'on' in line:
        repl = True
    elif 'off' in line:
        repl = False
    else:
        repl = np.invert(grid[x1:x2+1, y1:y2+1])
    grid[x1:x2+1, y1:y2+1] = repl

print(grid.sum())


