inp = File.read "input.txt"
prog = inp.lines

mem = {"a" => 1, "b" => 0}
line = 0

while 0 <= line < prog.size
  case prog[line].strip
  when /hlf (.)/
    mem[$1] /= 2
  when /tpl (.)/
    mem[$1] *= 3
  when /inc (.)/
    mem[$1] += 1
  when /jmp (.+)/
    line += $1.to_i
    next
  when /jie (.), (.+)/
    if mem[$1].even?
      line += $2.to_i
      next
    end
  when /jio (.), (.+)/
    if mem[$1] == 1
      line += $2.to_i
      next
    end
  end
  line += 1
end

p mem["b"]
