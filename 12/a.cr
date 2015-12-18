inp = File.read("input.txt")

puts inp.scan(/-?[0-9]+/).map { |m| m[0].to_i } .sum
