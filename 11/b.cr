pw = File.read("input.txt").strip

2.times do
  loop do
    pw = pw.succ

    break if (
      pw.chars.each_cons(3).any? { |a|
        a[0].succ == a[1] && a[1].succ == a[2]
      } &&
      ['i', 'o', 'l'].none? { |c|
        pw.includes? c
      } &&
      pw.scan(/(\w)\1/).size > 1
    )
  end
end

puts pw
