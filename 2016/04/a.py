import re
import collections

result = 0
with open('input.txt') as f:
    for line in f:
        *groups, code, check = re.findall(r'\w+', line)
        counts = collections.Counter(''.join(groups))
        if ''.join(sorted(counts, key=lambda c: (-counts[c], c))).startswith(check):
            result += int(code)
print(result)
