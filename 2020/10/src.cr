def one(text)
  joltages = text
    .each_line
    .map(&.to_i)
    .to_a
    .sort!

  ones = 1
  threes = 1

  joltages.each_cons_pair do |a, b|
    case b - a
    when 1 then ones += 1
    when 3 then threes += 1
    end
  end

  return ones * threes
end

def two(text)
  joltages = text
    .each_line
    .map(&.to_i)
    .to_a
    .sort!
    .unshift(0)

  slices = joltages.slice_when { |a, b| b - a == 3 }

  return slices.product(1_i64) do |slice|
    # The following values were determined through induction. In this
    # case, they work because the input never produces a slice of size
    # greater than 5.
    case slice.size
    when 1, 2 then 1
    when 3 then 2
    when 4 then 4
    when 5 then 7
    else raise "Slice size unaccounted for"
    end
  end
end
