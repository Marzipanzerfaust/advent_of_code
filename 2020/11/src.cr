COORDINATES = {
  {-1, -1}, {-1, 0}, {-1, +1},
  {0, -1}, {0, +1},
  {+1, -1}, {+1, 0}, {+1, +1}
}

def one(text)
  seats = text.each_line.map(&.chars).to_a
  succ = seats.clone

  height = seats.size
  width = seats.first.size

  loop do
    changed = false

    seats.each_with_index do |row, i|
      row.each_with_index do |seat, j|
        next if seat == '.'

        occupied = COORDINATES.count do |x, y|
          new_i = i + x
          new_j = j + y

          next unless 0 <= new_i < height
          next unless 0 <= new_j < width

          seats[new_i][new_j] == '#'
        end

        if seat == 'L' && occupied == 0
          succ[i][j] = '#'
          changed = true
        elsif seat == '#' && occupied >= 4
          succ[i][j] = 'L'
          changed = true
        end
      end
    end

    break unless changed

    seats = succ.clone
  end

  return seats.sum &.count '#'
end

def two(text)
  seats = text.each_line.map(&.chars).to_a
  succ = seats.clone

  height = seats.size
  width = seats.first.size

  loop do
    changed = false

    seats.each_with_index do |row, i|
      row.each_with_index do |seat, j|
        next if seat == '.'

        occupied = COORDINATES.count do |x, y|
          new_i = i + x
          new_j = j + y

          found = false

          while 0 <= new_i < height && 0 <= new_j < width
            case seats[new_i][new_j]
            when '#'
              found = true
              break
            when 'L'
              break
            when '.'
              new_i += x
              new_j += y
            end
          end

          found
        end

        if seat == 'L' && occupied == 0
          succ[i][j] = '#'
          changed = true
        elsif seat == '#' && occupied >= 5
          succ[i][j] = 'L'
          changed = true
        end
      end
    end

    break unless changed

    seats = succ.clone
  end

  return seats.sum &.count '#'
end
