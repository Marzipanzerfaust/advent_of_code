def part_one(input)
  input.each_line.sum do |line|
    line =~ /([a-z-]+)(\d+)\[([a-z]+)\]/
    name, id, checksum = $1, $2, $3
    name = name.gsub(/-/, nil)

    counter = name.each_char.tally

    expected = counter.keys
      .sort_by { |k| counter[k] }
      .reverse
      .sort { |a, b| counter[a] == counter[b] ? a <=> b : 0 }
      .first(5).join

    if checksum != expected
      puts "================================================================="
      puts "#{name}, #{id}, #{checksum}, #{expected}"
      puts counter
      puts
    end

    if checksum == expected
      id.to_i
    else
      0
    end
  end
end

def part_two(input)
end
