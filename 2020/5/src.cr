def one(text)
  text.each_line.max_of do |line|
    row = column = 0

    (6..0).step(-1).each_with_index do |x, i|
      if line[x] == 'B'
        row += 1 << i
      end
    end

    (9..7).step(-1).each_with_index do |x, i|
      if line[x] == 'R'
        column += 1 << i
      end
    end

    row * 8 + column
  end
end

def two(text)
  # First, produce a sorted list of ID's

  ids = text.lines.map do |line|
    row = column = 0

    (6..0).step(-1).each_with_index do |x, i|
      if line[x] == 'B'
        row += 1 << i
      end
    end

    (9..7).step(-1).each_with_index do |x, i|
      if line[x] == 'R'
        column += 1 << i
      end
    end

    row * 8 + column
  end

  # Next, find the ID that is greater than the previous by one and less
  # than the next by one

  ids.sort.each_cons_pair do |a, b|
    if b - a == 2
      return a + 1
    end
  end
end
