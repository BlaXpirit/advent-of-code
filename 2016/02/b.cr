pos = {-2, 0}

keys = [
    {0, -2},
    {-1, -1}, {0, -1}, {1, -1},
    {-2, 0}, {-1, 0}, {0, 0}, {1, 0}, {2, 0},
    {-1, 1}, {0, 1}, {1, 1},
    {0, 2}
]

File.each_line("input.txt") do |line|
  line.chomp.each_char do |c|
    x, y = pos
    case c
    when 'U'
      y -= 1
    when 'D'
      y += 1
    when 'L'
      x -= 1
    when 'R'
      x += 1
    end

    pos = {x, y} if keys.includes?({x, y})
  end
  print (keys.index(pos).not_nil! + 1).to_s(base: 16, upcase: true)
end

puts
