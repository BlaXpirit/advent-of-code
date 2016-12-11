inp = File.read("input.txt").to_i

inp /= 11

counts = Array.new(inp, 0)
(1..inp).each do |n|
  i = 0
  n.step(by: n, limit: {inp-1, n*50}.min) do |i|
    counts[i] += n
  end
end

p counts.index { |c| c >= inp }
