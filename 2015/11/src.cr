ALPHABET = 'a'..'z'

def valid?(passwd)
  !!(
    ALPHABET.each_cons(3).any? { |x| passwd[x.join]? } &&
    passwd.count("iol").zero? &&
    passwd[/(\w)\1.*(\w)\2/]?
  )
end

def part_one(input)
  loop do
    input = input.succ
    break if valid?(input)
  end

  return input
end

def part_two(input)
  part_one(part_one(input))
end
