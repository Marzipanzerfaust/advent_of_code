def part_one(input, target)
  sizes = input.each_line.map(&.to_i).to_a

  combos = [] of Array(Int32)

  1.upto(sizes.size) do |i|
    sizes
      .each_combination(i)
      .select { |c| c.sum == target }
      .each { |c| combos << c }
  end

  return combos.size
end

def part_two(input, target)
  sizes = input.each_line.map(&.to_i).to_a

  combos = [] of Array(Int32)

  1.upto(sizes.size) do |i|
    sizes
      .each_combination(i)
      .select { |c| c.sum == target }
      .each { |c| combos << c }
  end

  min_size = combos.min_of(&.size)

  return combos.count { |c| c.size == min_size }
end
