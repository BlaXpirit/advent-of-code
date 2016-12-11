people = Set(String).new
compat = Hash({String, String}, Int32).new

File.open("input.txt").each_line do |line|
  line =~ /(.+) would (gain|lose) (\d+) happiness units by sitting next to (.+)\./
  n = $3.to_i
  n = -n if $2 == "lose"
  compat[{$1, $4}] = n
  people.add $1
end

options = people.to_a.each_permutation.map { |perm|
  (perm + [perm.first]).each_cons(2).sum { |pair|
    a, b = pair
    compat[{a, b}] + compat[{b, a}]
  }
}

p options.max
