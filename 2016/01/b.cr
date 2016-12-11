inp = File.read "input.txt"

x, y = 0, 0
dx, dy = 0, -1

visited = Set({Int32, Int32}).new

inp.scan(/([LR])(\d+)/) do
  case $1
  when "L"
    dx, dy = -dy, dx
  when "R"
    dx, dy = dy, -dx
  end

  $2.to_i.times do
    break if visited.includes?({x, y})
    visited.add({x, y})

    x += dx
    y += dy
  end
  break if visited.includes?({x, y})
end

p x.abs + y.abs
