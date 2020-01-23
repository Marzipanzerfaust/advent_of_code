def part_one(input)
  scores = Hash(String, Hash(String, Int32)).new do |hash, key|
    hash[key] = {} of String => Int32
  end

  input.each_line do |line|
    line =~ /(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)\./

    a, b = $1, $4
    n = $3.to_i
    n = -n if $2 == "lose"

    scores[a][b] = n
  end

  return scores.keys.permutations.max_of do |p|
    p.each_cons(2).sum { |(a, b)| scores[a][b] + scores[b][a] } +
      scores.dig(p[0], p[-1]) + scores.dig(p[-1], p[0])
  end
end

def part_two(input)
  scores = Hash(String, Hash(String, Int32)).new do |hash, key|
    hash[key] = {} of String => Int32
  end

  input.each_line do |line|
    line =~ /(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)\./

    a, b = $1, $4
    n = $3.to_i
    n = -n if $2 == "lose"

    scores[a][b] = n
  end

  # Add myself
  scores.each_key do |k|
    scores["Jeffrey"][k] = scores[k]["Jeffrey"] = 0
  end

  return scores.keys.permutations.max_of do |p|
    p.each_cons(2).sum { |(a, b)| scores[a][b] + scores[b][a] } +
      scores.dig(p[0], p[-1]) + scores.dig(p[-1], p[0])
  end
end
