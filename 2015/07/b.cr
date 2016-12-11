program = File.read_lines("input.txt").map &.strip

$wires = {} of String => UInt64

def var(expr)
  expr.to_u64 { $wires[expr] }
end

def execute(program)
  lines = program.dup
  until lines.empty?
    i = 0
    while i < lines.size
      expr, dest = lines[i].strip.split " -> "
      begin
        out = case expr
        when /(.+) AND (.+)/
          (var $1) & (var $2)
        when /(.+) OR (.+)/
          (var $1) | (var $2)
        when /NOT (.+)/
          ~(var $1)
        when /(.+) LSHIFT (.+)/
          (var $1) << (var $2)
        when /(.+) RSHIFT (.+)/
          (var $1) >> (var $2)
        else
          var expr
        end
      rescue KeyError
        i += 1
      else
        $wires[dest] = out unless $wires.has_key? dest
        lines.delete_at i
      end
    end
  end
end

execute program
$wires = {"b" => $wires["a"]}
execute program
p $wires["a"]
