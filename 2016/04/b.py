import re
import collections
import string


with open('input.txt') as f:
    for line in f:
        *groups, code, check = re.findall(r'\w+', line)
        counts = collections.Counter(''.join(groups))

        if ''.join(sorted(counts, key=lambda c: (-counts[c], c))).startswith(check):
            if [
                ''.join(chr((ord(c) - ord('a') + int(code)) % 26 + ord('a')) for c in group)
                for group in groups
            ] == 'northpole object storage'.split():
                print(code)
