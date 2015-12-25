inp = File.read("input.txt").strip

replacements, inp = inp.split("\n\n")
replacements = replacements.lines.map(&.strip.split(" => "))

all = Set(String).new

replacements.each do |repl|
  a, b = repl
  (0...inp.size).each do |i|
    if inp[i, a.size] == a
      all.add(inp[0...i] + b + inp[i+a.size...inp.size])
    end
  end
end

p all.size
