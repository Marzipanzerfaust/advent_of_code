def presents_by_10(n)
  n * 10 + (1..n//2).sum { |m| n.divisible_by?(m) ? m * 10 : 0 }
end

def part_one(input)
  target = input.to_i

  base = if target <= 100_000
           2
         else
           6 * (Math.log10(target).to_i - 1)
         end

  return (base..).step(base).find { |n| presents_by_10(n) >= target }
end

def presents_by_11(n)
end

def part_two(input)
  target = input.to_i

  base = 1

  return (base..).step(base).find { |n| presents_by_11(n) >= target }
end
