record Ingredient, capacity, durability, flavor, texture, calories

def part_one(input)
  ingredients = [] of Ingredient

  input.each_line do |line|
    line =~ /\w+: capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)/
    ingredients << Ingredient.new(*$~.captures.map(&.to_i))
  end

  scores = [] of Int32

  ingredients.size.times do |i|

  end
end

def part_two(input)

end
