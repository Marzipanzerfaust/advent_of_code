def part_one(input)
  replacements = Hash(String, Array(String)).new do |hash, key|
    hash[key] = [] of String
  end

  lines = input.split('\n', remove_empty: true)

  lines[...-1].each do |line|
    k, v = line.split(" => ")
    replacements[k] << v
  end

  molecule = lines.last

  possible_generations = Set(String).new

  replacements.each do |atom, reps|
    molecule.scan(/#{atom}/) do |match|
      idx = match.begin.not_nil!

      reps.each do |rep|
        possible_generations << molecule[...idx] + molecule[idx..].sub(atom, rep)
      end
    end
  end

  return possible_generations.size
end

def part_two(input)
  replacements = Hash(String, Array(String)).new do |hash, key|
    hash[key] = [] of String
  end

  lines = input.split('\n', remove_empty: true)

  lines[...-1].each do |line|
    k, v = line.split(" => ")
    replacements[k] << v
  end

  molecule = lines.last


end
