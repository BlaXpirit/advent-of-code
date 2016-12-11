inp = File.read "input.txt"

x, y = 0, 0
dx, dy = 0, -1

inp.scan(/([LR])(\d+)/) do
  case $1
  when "L"
    dx, dy = -dy, dx
  when "R"
    dx, dy = dy, -dx
  end
  x += dx * $2.to_i
  y += dy * $2.to_i
end

p x.abs + y.abs
