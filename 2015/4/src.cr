require "digest"

def part_one(input)
  (1..).each do |i|
    hash = Digest::MD5.hexdigest("#{input}#{i}")
    return i if hash[0, 5] == "00000"
  end
end

def part_two(input)
  (1..).each do |i|
    hash = Digest::MD5.hexdigest("#{input}#{i}")
    return i if hash[0, 6] == "000000"
  end
end
