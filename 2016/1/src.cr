def part_one(input)
  x, y = 0, 0
  direction = 0

  input.split(", ").each do |comm|
    turn, steps = comm[0], comm[1..]
    steps = steps.to_i

    case turn
    when 'R' then direction += 1
    when 'L' then direction -= 1
    end

    direction %= 4

    case direction
    when 0 then y += steps
    when 1 then x += steps
    when 2 then y -= steps
    when 3 then x -= steps
    end
  end

  return x.abs + y.abs
end

def part_two(input)
  locations_visited = Set{ {0, 0} }

  x, y = 0, 0
  direction = 0

  input.split(", ").each do |comm|
    turn, steps = comm[0], comm[1..]
    steps = steps.to_i

    case turn
    when 'R' then direction += 1
    when 'L' then direction -= 1
    end

    direction %= 4

    steps.times do
      case direction
      when 0 then y += 1
      when 1 then x += 1
      when 2 then y -= 1
      when 3 then x -= 1
      end

      if locations_visited.includes?({x, y})
        return x.abs + y.abs
      else
        locations_visited << {x, y}
      end
    end
  end
end
