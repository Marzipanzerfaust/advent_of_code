require "bit_array"

def part_one(input)
  lights = BitArray.new(1_000_000)

  input.each_line do |line|
    line =~ /(turn on|turn off|toggle) (\d+,\d+) through (\d+,\d+)/
    comm, first, last = $1, $2, $3

    x0, y0 = first.split(',').map(&.to_i)
    x1, y1 = last.split(',').map(&.to_i)

    (x0..x1).each do |x|
      (y0..y1).each do |y|
        idx = x + y * 1000

        case comm
        when "turn on"
          lights[idx] = true
        when "turn off"
          lights[idx] = false
        when "toggle"
          lights.toggle(idx)
        end
      end
    end
  end

  return lights.count { |l| l == true }
end

def part_two(input)
  lights = Slice(UInt32).new(1_000_000)

  input.each_line do |line|
    line =~ /(turn on|turn off|toggle) (\d+,\d+) through (\d+,\d+)/
    comm, first, last = $1, $2, $3

    x0, y0 = first.split(',').map(&.to_i)
    x1, y1 = last.split(',').map(&.to_i)

    (x0..x1).each do |x|
      (y0..y1).each do |y|
        idx = x + y * 1000

        case comm
        when "turn on"
          lights[idx] += 1
        when "turn off"
          lights[idx] -= 1 unless lights[idx] == 0
        when "toggle"
          lights[idx] += 2
        end
      end
    end
  end

  return lights.sum
end
