def part_one(input)
  lines = input.lines

  columns_n = lines.first.size

  counters = Array(Hash(Char, Int32)).new(columns_n) do
    Hash(Char, Int32).new(0, lines.size)
  end

  lines.each do |line|
    line.each_char.with_index do |char, i|
      counters[i][char] += 1
    end
  end

  msg = String.build(columns_n) do |out|
    counters.each do |c|
      out << c.keys.max_by { |k| c[k] }
    end
  end

  return msg
end

def part_two(input)
  lines = input.lines

  columns_n = lines.first.size

  counters = Array(Hash(Char, Int32)).new(columns_n) do
    Hash(Char, Int32).new(0, lines.size)
  end

  lines.each do |line|
    line.each_char.with_index do |char, i|
      counters[i][char] += 1
    end
  end

  msg = String.build(columns_n) do |out|
    counters.each do |c|
      out << c.keys.min_by { |k| c[k] }
    end
  end

  return msg
end
