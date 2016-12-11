inp = File.read "input.txt"

total = 0
inp.lines.each do |line|
  dim = line.split('x').map &.to_i
  total += (dim.sum - dim.max)*2 + dim.inject { |a, b| a*b }
end

puts total
