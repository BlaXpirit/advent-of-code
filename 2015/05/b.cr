answer = File.read_lines("input.txt").count { |line|
  line = line.strip
  (0...line.size-2).any? { |i|
    (i+2...line.size).any? { |j|
      line[i, 2] == line[j, 2]
    }
  } &&
  line.chars.each_cons(3).any? { |s|
    s.first == s.last
  }
}
p answer
