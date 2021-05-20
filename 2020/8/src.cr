require "bit_array"

def one(text)
  idx = acc = 0
  instructions = text.lines
  tracker = BitArray.new(instructions.size)

  loop do
    if tracker[idx]
      return acc
    else
      tracker[idx] = true
    end

    lhs, _, rhs = instructions[idx].partition(' ')

    case lhs
    when "acc"
      acc += rhs.to_i
      idx += 1
    when "jmp"
      idx += rhs.to_i
    when "nop"
      idx += 1
    end
  end
end

def two(text)
  idx = acc = 0
  instructions = text.lines
  tracker = BitArray.new(instructions.size)

  # Find each line that has either a `jmp` or `nop`.
  jmps = [] of Int32
  nops = [] of Int32

  instructions.each_with_index do |line, i|
    case line[0, 3]
    when "jmp" then jmps << i
    when "nop" then nops << i
    end
  end

  jmps.each do |i|
    arg = instructions[i][4..]
    instructions[i] = "nop #{arg}"

    until tracker[idx]
      tracker[idx] = true

      lhs, _, rhs = instructions[idx].partition(' ')

      case lhs
      when "acc"
        acc += rhs.to_i
        idx += 1
      when "jmp"
        idx += rhs.to_i
      when "nop"
        idx += 1
      end

      if idx >= instructions.size
        return acc
      end
    end

    instructions[i] = "jmp #{arg}"

    idx = acc = 0
    tracker.each_index { |i| tracker[i] = false }
  end

  nops.each do |i|
    arg = instructions[i][4..]
    instructions[i] = "jmp #{arg}"

    until tracker[idx]
      tracker[idx] = true

      lhs, _, rhs = instructions[idx].partition(' ')

      case lhs
      when "acc"
        acc += rhs.to_i
        idx += 1
      when "jmp"
        idx += rhs.to_i
      when "nop"
        idx += 1
      end

      if idx >= instructions.size
        return acc
      end
    end

    instructions[i] = "nop #{arg}"

    idx = acc = 0
    tracker.each_index { |i| tracker[i] = false }
  end
end
