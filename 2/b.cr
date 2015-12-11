inp = File.read "input.txt"

total = 0
inp.lines.each do |line|
  dims = line.split('x').map &.to_i
  sides = dims.combinations(2).map &.inject { |a, b| a*b }
  total += sides.sum*2 + sides.min
end

puts total
