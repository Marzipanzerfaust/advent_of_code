def one(text)
  text.lines.each_combination(2, true) do |(a, b)|
    x = a.to_i
    y = b.to_i

    if x + y == 2020
      return x * y
    end
  end
end

def two(text)
  text.lines.each_combination(3, true) do |(a, b, c)|
    x = a.to_i
    y = b.to_i
    z = c.to_i

    if x + y + z == 2020
      return x * y * z
    end
  end
end
