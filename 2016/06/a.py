import collections

with open('input.txt') as f:
    print(''.join(
        collections.Counter(col).most_common()[0][0]
        for col in zip(*f)
    )
)
