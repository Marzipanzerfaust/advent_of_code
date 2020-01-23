def part_one(input)
  floor = 0

  input.each_char do |char|
    case char
    when '(' then floor += 1
    when ')' then floor -= 1
    end
  end

  return floor
end

def part_two(input)
  floor = 0

  input.each_char.with_index do |char, i|
    case char
    when '(' then floor += 1
    when ')' then floor -= 1
    end

    if floor < 0
      return i + 1
    end
  end
end
