TIME = 2503
p File.read_lines("input.txt").map { |line|
  speed, duration, timeout = line.scan(/\d+/).map { |m| m[0].to_i }
  total = duration + timeout
  (TIME / total * duration + {duration, TIME % total}.min) * speed
} .max
