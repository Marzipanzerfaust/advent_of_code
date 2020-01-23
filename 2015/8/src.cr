def part_one(input)
  input.each_line.sum do |line|
    encoded = line
      .strip('"')
      .gsub(/\\{2}/, '\\')
      .gsub(/\\\"/, '"')
      .gsub(/\\x([0-9a-f]{2})/) { $1.to_i(16).chr }

    a = line.size
    b = encoded.size

    a - b
  end
end

def part_two(input)
  input.each_line.sum do |line|
  end
end
