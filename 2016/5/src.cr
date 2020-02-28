require "digest"

def part_one(input)
  String.build(8) do |password|
    (0..).each do |i|
      hash = Digest::MD5.hexdigest("#{input}#{i}")

      if hash[0, 5] == "00000"
        password << hash[5]
        break if password.bytesize == 8
      end
    end
  end
end

def part_two(input)
  password = Pointer(UInt8).malloc(8)

  (0..).each do |i|
    hash = Digest::MD5.hexdigest("#{input}#{i}")

    if hash[0, 5] == "00000"
      idx = hash[5].to_i?

      next unless idx && idx < 8

      if password[idx] == 0
        password[idx] = hash.to_unsafe[6]

        if (0...8).none? { |i| password[i] == 0 }
          break
        end
      end
    end
  end

  return String.new(password)
end
