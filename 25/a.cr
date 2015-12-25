inp = File.read "input.txt"

p = {
  inp[/row (\d+)/, 1],
  inp[/column (\d+)/, 1]
}.map &.to_i

x = y = 1

n = 20151125u64

while {y, x} != p
  x += 1
  y -= 1
  if y <= 0
    y = x
    x = 1
  end
  n = n * 252533 % 33554393
end

puts n
