count = 0

File.each_line("input.txt").each_slice(3) do |lines|
  lines.map { |line| line.split.map &.to_i } .transpose.each do |numbers|
    if numbers.all? { |n| numbers.sum - n > n }
      count += 1
    end
  end
end

p count
