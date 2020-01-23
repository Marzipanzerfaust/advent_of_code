def part_one(input)
  x, y = 0, 0

  locations = Set(Tuple(Int32, Int32)).new
  locations << {0, 0}

  input.each_char do |dir|
    case dir
    when '^' then y += 1
    when 'v' then y -= 1
    when '>' then x += 1
    when '<' then x -= 1
    end

    locations << {x, y}
  end

  return locations.size
end

def part_two(input)
  x1 = x2 = 0
  y1 = y2 = 0

  locations = Set(Tuple(Int32, Int32)).new
  locations << {0, 0}

  input.each_char.with_index do |dir, i|
    if i.even?
      case dir
      when '^' then y1 += 1
      when 'v' then y1 -= 1
      when '>' then x1 += 1
      when '<' then x1 -= 1
      end
    else
      case dir
      when '^' then y2 += 1
      when 'v' then y2 -= 1
      when '>' then x2 += 1
      when '<' then x2 -= 1
      end
    end

    locations << {x1, y1}
    locations << {x2, y2}
  end

  return locations.size
end
