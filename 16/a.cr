def extract(s)
  s.scan(/(\w+) *[:<=>]+ *(\d+)/).map { |m|
    {m[1], m[2].to_i }
  } .to_h
end

sample = extract File.read("sample.txt")

File.each_line("input.txt") do |line|
  candidate = extract line
  if sample == sample.merge candidate
    line =~ /(\d+)/
    puts $1
  end
end
