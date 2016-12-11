inp = File.read("input.txt")

containers = inp.split.map &.to_i
TOTAL = 150

result = 0
(0 ... containers.size).each do |comb_size|
  containers.each_combination(comb_size) do |comb|
    result += 1 if comb.sum == TOTAL
  end
end

p result
