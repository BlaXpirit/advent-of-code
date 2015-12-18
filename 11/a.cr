pw = File.read("input.txt").strip

until (
  pw.chars.each_cons(3).any? { |a|
    a[0].succ == a[1] && a[1].succ == a[2]
  } &&
  ['i', 'o', 'l'].none? { |c|
    pw.includes? c
  } &&
  pw.scan(/(\w)\1/).size > 1
)
  pw = pw.succ
end

puts pw
