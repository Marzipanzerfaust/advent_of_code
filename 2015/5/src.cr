def part_one(input)
  input.each_line.sum do |line|
    one = line.count(&.in_set? "aeiou") >= 3
    two = line[/(\w)\1/]?
    three = !line[/ab|cd|pq|xy/]?

    one && two && three ? 1 : 0
  end
end

def part_two(input)
  input.each_line.sum do |line|
    one = line[/(\w{2}).*\1/]?
    two = line[/(\w)\w\1/]?

    one && two ? 1 : 0
  end
end
