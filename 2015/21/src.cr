record Item, cost : Int32, damage : Int32, armor : Int32

WEAPONS = {
  "Dagger" => Item.new(8, 4, 0),
  "Shortsword" => Item.new(10, 5, 0),
  "Warhammer" => Item.new(25, 6, 0),
  "Longsword" => Item.new(40, 7, 0),
  "Greataxe" => Item.new(74, 8, 0)
}

ARMOR = {
  "Leather" => Item.new(13, 0, 1),
  "Chainmail" => Item.new(31, 0, 2),
  "Splintmail" => Item.new(53, 0, 3),
  "Bandedmail" => Item.new(75, 0, 4),
  "Platemail" => Item.new(102, 0, 5)
}

RINGS = {
  "Damage +1" => Item.new(25, 1, 0),
  "Damage +2" => Item.new(50, 2, 0),
  "Damage +3" => Item.new(100, 3, 0),
  "Defense +1" => Item.new(20, 0, 1),
  "Defense +2" => Item.new(40, 0, 2),
  "Defense +3" => Item.new(80, 0, 3)
}

struct Character
  property health : Int32
  property damage : Int32
  property armor : Int32

  def initialize(@health, @damage, @armor)
  end

  # Returns the number of hits necessary to kill another character
  def hits_to_kill(other : self)
    diff = @damage - other.armor
    damage_per_hit = diff >= 1 ? diff : 1

    return (other.health / damage_per_hit).ceil.to_i
  end
end

def part_one(input)
  player = Character.new(100, 0, 0)

  input =~ /Hit Points: (\d+)\nDamage: (\d+)\nArmor: (\d+)/
  boss = Character.new($1.to_i, $2.to_i, $3.to_i)
end

def part_two(input)
end
