def part_one(input, seconds)
  distances = Hash(String, Int32).new(0)
  intervals = {} of String => Iterator(Int32)

  input.each_line do |line|
    line =~ /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

    name = $1
    speed = $2.to_i
    moving = $3.to_i
    resting = $4.to_i

    moving_intervals = Array.new(moving, speed)
    resting_intervals = Array.new(resting, 0)

    intervals[name] = moving_intervals.each
      .chain(resting_intervals.each)
      .cycle
  end

  intervals.each do |name, iter|
    seconds.times { distances[name] += iter.next.as(Int32) }
  end

  return distances.values.max
end

def part_two(input, seconds)
  scores = Hash(String, Int32).new(0)

  distances = Hash(String, Int32).new(0)
  intervals = {} of String => Iterator(Int32)

  input.each_line do |line|
    line =~ /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

    name = $1
    speed = $2.to_i
    moving = $3.to_i
    resting = $4.to_i

    moving_intervals = Array.new(moving, speed)
    resting_intervals = Array.new(resting, 0)

    cycles = (seconds / (moving_intervals.size + resting_intervals.size)).ceil.to_i

    intervals[name] = moving_intervals.each
      .chain(resting_intervals.each)
      .cycle(cycles)
  end

  seconds.times do |i|
    intervals.each do |name, iter|
      distances[name] += iter.next.as(Int32)
    end

    winners = distances.keys.select do |name|
      distances[name] == distances.values.max
    end

    winners.each { |name| scores[name] += 1 }
  end

  return scores.values.max
end
