inp = File.read("input.txt").to_i

inp /= 10

counts = Array.new(inp, 0)
(1..inp).each do |n|
  n.step by: n, limit: inp-1 do |i|
    counts[i] += n
  end
end

p counts.index { |c| c >= inp }
