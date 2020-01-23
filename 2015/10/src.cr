def part_one(input, n = 1)
  n.times do
    input = input.gsub(/(\w)\1*/) { |m| "#{m.size}#{$1}" }
  end

  return input
end

def part_two(input)
end
