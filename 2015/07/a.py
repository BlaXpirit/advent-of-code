from pathlib import Path
import re


inp = Path('input.txt').read_text()

env = {}
lines = []

for line in inp.splitlines():
    line = re.sub(r'([a-z]+)', r'\1_', line)
    expr, name = line.split(' -> ')
    for k, v in {
        'OR': '|', 'AND': '&', 'NOT': '~',
        'RSHIFT': '>>', 'LSHIFT': '<<',
    }.items():
        expr = expr.replace(k, v)
    lines.append('{} = {}'.format(name, expr))

while 'a_' not in env:
    i = 0
    while i < len(lines):
        try:
            exec(lines[i], env)
        except NameError:
            i += 1
        else:
            del lines[i]

print(env['a_'])
