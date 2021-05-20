def one(text)
  lines = text.lines
  width = lines[0].size
  x = 0
  total = 0

  (0...lines.size).each do |y|
    total += 1 if lines[y][x % width] == '#'
    x += 3
  end

  return total
end

def two(text)
  lines = text.lines
  width = lines[0].size

  slopes = {
    { 1, 1 },
    { 3, 1 },
    { 5, 1 },
    { 7, 1 },
    { 1, 2 }
  }

  trees = slopes.map do |(slope_x, slope_y)|
    x = 0
    total = 0

    (0...lines.size).step(slope_y).each do |y|
      total += 1 if lines[y][x % width] == '#'
      x += slope_x
    end

    total
  end

  return trees.product
end
