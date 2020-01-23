READING = {
  "children" => 3,
  "cats" => 7,
  "samoyeds" => 2,
  "pomeranians" => 3,
  "akitas" => 0,
  "vizslas" => 0,
  "goldfish" => 5,
  "trees" => 3,
  "cars" => 2,
  "perfumes" => 1
}

def part_one(input)
  sues = Hash(Int32, Hash(String, Int32)).new(initial_capacity: 500)

  input.each_line.with_index do |line, i|
    result = {} of String => Int32

    line.scan(/(\w+): (\d+)/).each do |m|
      result[m[1]] = m[2].to_i
    end

    sues[i + 1] = result
  end

  return sues.keys.find do |k|
    sues[k].all? { |pair| READING.includes?(pair) }
  end
end

def part_two(input)
  sues = Hash(Int32, Hash(String, Int32)).new(initial_capacity: 500)

  input.each_line.with_index do |line, i|
    result = {} of String => Int32

    line.scan(/(\w+): (\d+)/).each do |m|
      result[m[1]] = m[2].to_i
    end

    sues[i + 1] = result
  end

  return sues.keys.find do |k|
    sues[k].all? do |key, value|
      case key
      when "cats", "trees"
        value > READING[key]
      when "pomeranians", "goldfish"
        value < READING[key]
      else
        value == READING[key]
      end
    end
  end
end
