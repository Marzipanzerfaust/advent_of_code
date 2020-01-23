def part_one(input)
  replacements = {} of String => String

  lines = input.split('\n', remove_empty: true)

  lines[..-1].each do |line|
    k, v = line.split(" => ")
    replacements[k] = v
  end

  molecule = lines.last
end

def part_two(input)
end
