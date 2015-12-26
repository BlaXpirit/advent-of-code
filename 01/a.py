from pathlib import Path


inp = Path('input.txt').read_text()

print(inp.count('(') - inp.count(')'))
