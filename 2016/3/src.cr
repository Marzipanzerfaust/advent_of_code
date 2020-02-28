def part_one(input)
  input.each_line.count do |line|
    line.split.map(&.to_i).each_permutation.all? { |(a, b, c)| a + b > c }
  end
end

def part_two(input)
  # First, we have to transpose the input

end
