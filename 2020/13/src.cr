def one(text)
  x, y = text.lines

  time = x.to_i
  buses = y.split(',').select(&.to_i?).map(&.to_i)

  times = buses.map do |id|
    output = 0

    until output >= time
      output += id
    end

    output
  end

  earliest_time, idx = times.each_with_index.min
  target = buses[idx]

  return target * (earliest_time - time)
end

def two(text)
  times = [] of Int32
  offsets = [] of Int32

  text.lines.last.split(',').each_with_index do |x, i|
    if x != "x"
      times << x.to_i
      offsets << i
    end
  end

  master = times.first

  # If the first time is the same as the index of another time, their
  # least common multiple can be used as the period; otherwise, the
  # period will be the first time.

  if i = offsets.index(master)
    period = master.lcm(times[i])
  else
    period = master
  end

  time = period.to_u64

  loop do
    initial = time - master

    if times.each_with_index.all? { |x, i| (initial + offsets[i]).divisible_by?(x) }
      return initial
    end

    time += period
  end
end
