require "crypto/md5"

inp = File.read("input.txt").strip

index = 0
password = ""
while password.size < inp.size
  hash = Crypto::MD5.hex_digest("#{inp}#{index}")
  if hash.starts_with? "00000"
    password += hash[5]
  end
  index += 1
end
puts password
