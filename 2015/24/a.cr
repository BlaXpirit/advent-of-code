inp = File.read "input.txt"

inp = inp.split.map &.to_u64

group_weight = inp.sum / 3

answer = UInt64::MAX

(0 ... inp.size).each do |group1_size|
  inp.each_combination(group1_size) do |group1|
    next unless group1.sum == group_weight
    rest = inp - group1
    if (0 ... rest.size).any? { |group2_size|
      rest.combinations(group2_size).any? { |group2|
        group2.sum == group_weight
      }
    }
      entang = group1.inject { |a, b| a*b }
      answer = entang if entang < answer
    end
  end
  break if answer != UInt64::MAX
end

p answer
