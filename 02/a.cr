inp = File.read "input.txt"

total = 0
inp.lines.each do |line|
  a, b, c = line.split('x').map &.to_i
  sides = [a*b, b*c, c*a]
  total += sides.sum*2 + sides.min
end

puts total
