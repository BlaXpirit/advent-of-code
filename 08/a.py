from ast import literal_eval
from pathlib import Path


inp = Path('input.txt').read_text()

total = 0
for line in inp.splitlines():
    txt = literal_eval(line)
    total += len(line) - len(txt)

print(total)
