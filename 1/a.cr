inp = File.read "input.txt"

puts inp.count('(') - inp.count(')')
