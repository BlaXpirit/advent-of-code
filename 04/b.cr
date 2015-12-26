require "crypto/md5"

inp = File.read("input.txt").strip

i = 0
loop do
  i += 1
  hash = Crypto::MD5.hex_digest("#{inp}#{i}")
  break if hash.starts_with? "0"*6
end

puts i
