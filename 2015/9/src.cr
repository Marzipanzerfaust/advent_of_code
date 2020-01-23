def part_one(input)
  distances = Hash(String, Hash(String, Int32)).new do |hash, key|
    hash[key] = {} of String => Int32
  end

  input.each_line do |line|
    line =~ /(\w+) to (\w+) = (\d+)/
    start, finish, distance = $1, $2, $3

    distances[finish][start] = distances[start][finish] = distance.to_i
  end

  return distances.keys.permutations.min_of do |p|
    p.each_cons(2).sum { |(a, b)| distances[a][b] }
  end
end

def part_two(input)
  distances = Hash(String, Hash(String, Int32)).new do |hash, key|
    hash[key] = {} of String => Int32
  end

  input.each_line do |line|
    line =~ /(\w+) to (\w+) = (\d+)/
    start, finish, distance = $1, $2, $3

    distances[finish][start] = distances[start][finish] = distance.to_i
  end

  return distances.keys.permutations.max_of do |p|
    p.each_cons(2).sum { |(a, b)| distances[a][b] }
  end
end
