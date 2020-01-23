require "./src"

input = <<-TEXT
123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
TEXT

lines = input.each_line

circuit = Hash(String, Wire).new(Wire.new)

line = lines.next
line =~ /(.+) -> (\w+)/
lhs, rhs = $1, $2

circuit[rhs].signal = lhs.to_u16

line = lines.next
line =~ /(.+) -> (\w+)/
lhs, rhs = $1, $2

circuit[rhs].signal = lhs.to_u16

puts circuit["x"].signal, circuit["y"].signal
