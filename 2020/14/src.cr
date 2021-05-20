def one(text)
  memory = {} of UInt64 => UInt64

  ones = uninitialized UInt64
  zeros = uninitialized UInt64

  text.each_line do |line|
    if line =~ /^mask = ([01X]{36})$/
      ones = 0u64
      zeros = UInt64::MAX

      $1.chars.reverse_each.with_index do |digit, i|
        case digit
        when '1'
          ones |= 1u64 << i
        when '0'
          zeros -= 1u64 << i
        end
      end
    elsif line =~ /^mem\[(\d+)\] = (\d+)$/
      lhs = $1.to_u64
      rhs = $2.to_u64

      rhs |= ones
      rhs &= zeros

      memory[lhs] = rhs
    end
  end

  return memory.each_value.sum
end

# Maximum unsigned 36-bit integer
MAX = 0b111_111_111_111_111_111_111_111_111_111_111_111

def two(text)
  memory = {} of UInt64 => UInt64

  ones = uninitialized UInt64
  floats = [] of UInt64

  text.each_line do |line|
    if line =~ /^mask = ([01X]{36})$/
      ones = 0u64
      floats = [] of Int32

      $1.chars.reverse_each.with_index do |digit, i|
        case digit
        when '1'
          ones |= 1u64 << i
        when 'X'
          floats << i
        end
      end
    elsif line =~ /^mem\[(\d+)\] = (\d+)$/
      lhs = $1.to_u64
      rhs = $2.to_u64

      lhs |= ones

      [0, 1].each_repeated_permutation(floats.size, true) do |bits|
        masked = lhs

        bits.each_with_index do |b, i|
          case b
          when 0
            masked &= MAX - (1u64 << floats[i])
          when 1
            masked |= 1u64 << floats[i]
          end
        end

        memory[masked] = rhs
      end
    end
  end

  return memory.each_value.sum
end
