require "matrix"

grid = Matrix(Int32).new(1000, 1000)

File.open("input.txt").each_line do |line|
  x1, y1, x2, y2 = line.scan(/\d+/).map { |m| m[0].to_i }
  y1.upto y2 do |y|
    x1.upto x2 do |x|
      n = grid[y, x]
      case line
      when /on/
        n += 1
      when /off/
        n = {n-1, 0}.max
      else
        n += 2
      end
      grid[y, x] = n
    end
  end
end

p grid.sum
