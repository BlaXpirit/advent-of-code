x = y = 2

File.each_line("input.txt") do |line|
  line.chomp.each_char do |c|
    case c
    when 'U'
      y -= 1 if y > 1
    when 'D'
      y += 1 if y < 3
    when 'L'
      x -= 1 if x > 1
    when 'R'
      x += 1 if x < 3
    end
  end
  print y*3 + x - 3
end

puts
