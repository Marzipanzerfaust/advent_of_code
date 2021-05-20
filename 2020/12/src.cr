enum Direction
  North
  East
  South
  West
end

def one(text)
  x = y = 0
  direction = Direction::East

  text.each_line do |line|
    action, units = line[0], line[1..].to_i

    case action
    when 'N'
      y += units
    when 'E'
      x += units
    when 'S'
      y -= units
    when 'W'
      x -= units
    when 'R'
      direction = Direction.from_value((direction.value + units // 90) % 4)
    when 'L'
      direction = Direction.from_value((direction.value - units // 90) % 4)
    when 'F'
      case direction
      when .north?
        y += units
      when .east?
        x += units
      when .south?
        y -= units
      when .west?
        x -= units
      end
    end
  end

  return x.abs + y.abs
end

def two(text)
  x = y = 0
  i = 10
  j = 1

  text.each_line do |line|
    action, units = line[0], line[1..].to_i

    case action
    when 'N'
      j += units
    when 'E'
      i += units
    when 'S'
      j -= units
    when 'W'
      i -= units
    when 'R'
      turns = units // 90

      case turns
      when 1
        i, j = j, -i
      when 2
        i, j = -i, -j
      when 3
        i, j = -j, i
      end
    when 'L'
      turns = units // 90

      case turns
      when 1
        i, j = -j, i
      when 2
        i, j = -i, -j
      when 3
        i, j = j, -i
      end
    when 'F'
      x += i * units
      y += j * units
    end
  end

  return x.abs + y.abs
end
