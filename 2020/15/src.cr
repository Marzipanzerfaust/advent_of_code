def one(text)
  spoken = 0
  tally = Hash(Int32, {Int32, Int32}).new { |h, k| h[k] = {0, 0} }

  numbers = Deque(Int32).new(text.split(',').map(&.to_i))

  i = 0

  loop do
    n = numbers.shift

    if turns = tally[n]?
      numbers.unshift(turns.first - turns.last)
    else
      spoken += 1

      if spoken == 2020
        return n
      end

      numbers.unshift(0)
    end

    tally[n] = {i, tally[n].first}

    i += 1
  end
end

def two(text)
end
