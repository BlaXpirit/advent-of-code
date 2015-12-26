inp = File.read "input.txt"

chars = {'(' => +1, ')' => -1}

pos = 0
i = 0
until pos < 0
  pos += chars[inp[i]]
  i += 1
end

p i
