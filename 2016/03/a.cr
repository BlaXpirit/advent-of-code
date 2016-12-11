count = 0

File.each_line("input.txt") do |line|
  numbers = line.split.map &.to_i
  if numbers.all? { |n| numbers.sum - n > n }
    count += 1
  end
end

p count
