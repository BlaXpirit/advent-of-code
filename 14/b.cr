TIME = 2503

deer = File.read_lines("input.txt").map { |line|
  line.scan(/\d+/).map { |m| m[0].to_i }
}

scores = [0] * deer.size

1.upto TIME do |t|
  positions = deer.map { |d|
    speed, duration, timeout = d
    total = duration + timeout
    (t / total * duration + {duration, t % total}.min) * speed
  }
  positions.each_with_index do |p, i|
    scores[i] += 1 if p == positions.max
  end
end

p scores.max
