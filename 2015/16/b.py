from pathlib import Path
import re

sample = list(Path('sample.txt').open())

for line in Path('input.txt').open():
    candidate = {
        m.group(1): int(m.group(2))
        for m in re.finditer(r'(\w+): (\d+)', line)
    }

    for s in sample:
        try:
            if not eval(s, candidate):
                break
        except NameError:
            pass
    else:
        print(re.search('\d+', line).group(0))
