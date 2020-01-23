# def part_one(input)
#   wires = {} of String => UInt16
#   lines = input.lines
#
#   until lines.empty?
#     lines.each.with_index do |line, i|
#       line =~ /(.+) -> (\w+)/
#       lhs, rhs = $1, $2
#
#       case lhs
#       when .to_u16?
#         wires[rhs] = lhs.to_u16
#       when /^(\w+)$/
#         next unless wires[$1]?
#
#         wires[rhs] = wires[$1]
#       when /^NOT (\w+)$/
#         next unless wires[$1]?
#
#         wires[rhs] = ~wires[$1]
#       when /^(\w+) (\w+) (\w+)$/
#         next unless wires[$1]?
#         next unless wires[$3]? unless $3.to_u16?
#
#         case $2
#         when "AND"
#           wires[rhs] = wires[$1] & wires[$3]
#         when "OR"
#           wires[rhs] = wires[$1] | wires[$3]
#         when "LSHIFT"
#           wires[rhs] = wires[$1] << $3.to_u16
#         when "RSHIFT"
#           wires[rhs] = wires[$1] >> $3.to_u16
#         end
#       end
#
#       lines.delete_at(i)
#       break
#     end
#   end
#
#   return wires
# end

# class Wire
#   setter value : UInt16
#   setter output : Proc(UInt16)
#
#   def initialize
#     @value = 0_u16
#     @gate = ->{ @value }
#   end
#
#   def signal
#     @gate.call
#   end
# end
#
# def part_one(input)
#   wires = Hash(String, Wire).new(Wire.new)
#
#   input.each_line do |line|
#     line =~ /(.+) -> (\w+)/
#     lhs, rhs = $1, $2
#
#     case lhs
#     when .to_u16?
#       puts 1
#       wires[rhs].value = lhs.to_u16
#     when /^(\w+)$/
#       puts 2
#       wires[rhs].gate = ->{ wires[$1].signal }
#     when /NOT (\w+)/
#       puts 3
#       wires[rhs].gate = ->{ wires[lhs].signal }
#     when /(\w+) (\w+) (\w+)/
#       case $2
#       when "AND"
#         puts 4
#         wires[rhs].gate = ->{ wires[$1].signal & wires[$3].signal }
#       when "OR"
#         puts 5
#         wires[rhs].gate = ->{ wires[$1].signal | wires[$3].signal }
#       when "LSHIFT"
#         puts 6
#         wires[rhs].gate = ->{ wires[$1].signal << $3.to_u16 }
#       when "RSHIFT"
#         puts 7
#         wires[rhs].gate = ->{ wires[$1].signal >> $3.to_u16 }
#       else
#         raise "Malformed expression: #{line}"
#       end
#     else
#       raise "Malformed expression: #{line}"
#     end
#   end
#
#   return wires
# end

# abstract struct Gate
#   abstract def call : UInt16
# end
#
# struct UnaryGate < Gate
#   @input : Wire
#
#   def initialize(@input, &@signal : Proc(UInt16, UInt16))
#   end
#
#   def call : UInt16
#     @signal.call(@input.signal)
#   end
# end
#
# struct BinaryGate < Gate
#   @a : Wire
#   @b : Wire | UInt16
#
#   def initialize(@a, @b, &@signal : Proc(UInt16, UInt16, UInt16))
#   end
#
#   def call : UInt16
#     if @b.is_a? Wire
#       @signal.call(@a.signal, @b.signal)
#     else
#       @signal.call(@a.signal, @b)
#     end
#   end
# end

# class Wire
#   setter signal : UInt16 | Gate
#
#   def initialize
#     @signal = 0_u16
#   end
#
#   def signal : UInt16
#     if @signal.is_a? Gate
#       @signal.as(Gate).output
#     else
#       @signal.as(UInt16)
#     end
#   end
# end
#
# alias Gate = UnaryGate | BinaryGate
#
# class UnaryGate
#   @input : Wire
#   @output : Proc(UInt16, UInt16)
#
#   def initialize(@input, &@output)
#   end
#
#   def output
#     @output.call(@input.signal)
#   end
# end
#
# class BinaryGate
#   @a : Wire
#   @b : Wire | UInt16
#   @output : Proc(UInt16, UInt16, UInt16)
#
#   def initialize(@a, @b, &@output)
#   end
#
#   def output
#     if @b.is_a? Wire
#       @output.call(@a.signal, @b.as(Wire).signal)
#     else
#       @output.call(@a.signal, @b.as(UInt16))
#     end
#   end
# end
#
# def part_one(input)
#   circuit = Hash(String, Wire).new(Wire.new)
#
#   input.each_line do |line|
#     line =~ /(.+) -> (\w+)/
#     lhs, rhs = $1, $2
#
#     case lhs
#     when .to_u16?
#       circuit[rhs].signal = lhs.to_u16
#     when /^(\w+)$/
#       circuit[rhs].signal = UnaryGate.new(circuit[$1]) { |x| x }
#     when /NOT (\w+)/
#       circuit[rhs].signal = UnaryGate.new(circuit[$1]) { |x| ~x }
#     when /(\w+) (\w+) (\w+)/
#       case $2
#       when "AND"
#         circuit[rhs].signal = BinaryGate.new(circuit[$1], circuit[$3]) { |a, b| a & b }
#       when "OR"
#         circuit[rhs].signal = BinaryGate.new(circuit[$1], circuit[$3]) { |a, b| a | b }
#       when "LSHIFT"
#         circuit[rhs].signal = BinaryGate.new(circuit[$1], $3.to_u16) { |a, b| a << b }
#       when "RSHIFT"
#         circuit[rhs].signal = BinaryGate.new(circuit[$1], $3.to_u16) { |a, b| a >> b }
#       end
#     end
#   end
#
#   return circuit.transform_values(&.signal)
# end

class Wire
  getter signal : UInt16?
  property dependents : Array(Wire)

  def initialize
    @signal = nil
    @dependents = [] of Wire
  end

  def signal=(n : UInt16)
    @signal = n

    @dependents.each do |d|
  end
end

def part_two(input)
end
