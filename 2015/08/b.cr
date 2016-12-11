p File.read("input.txt").lines.sum { |line|
  line = line.strip
  line.inspect.size - line.size
}
