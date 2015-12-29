inp = File.read("input.txt")

containers = inp.split.map &.to_i
TOTAL = 150

(0 ... containers.size).each do |comb_size|
  result = 0
  containers.each_combination(comb_size) do |comb|
    result += 1 if comb.sum == TOTAL
  end
  if result > 0
    p result
    break
  end
end
