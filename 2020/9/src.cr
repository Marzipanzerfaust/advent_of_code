def one(text, preamble)
  numbers = text.lines.map &.to_i64

  numbers[preamble..].each_with_index do |n, i|
    previous = numbers[i, preamble]
    return n if previous.each_combination(2, true).none? { |(a, b)| a + b == n }
  end
end

def two(text, preamble)
  numbers = text.lines.map &.to_i64

  target = 0_i64

  numbers[preamble..].each_with_index.find do |n, i|
    previous = numbers[i, preamble]

    if previous.each_combination(2, true).none? { |(a, b)| a + b == n }
      target = n
      break
    end
  end

  numbers.each_index do |i|
    sum = numbers[i]
    finish = i

    numbers[i+1..].each_with_index do |n, j|
      sum += n

      if sum >= target
        finish = i + j + 1
        break
      end
    end

    if sum == target
      range = numbers[i..finish]
      return range.min + range.max
    end
  end
end
