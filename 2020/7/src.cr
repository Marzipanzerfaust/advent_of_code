TARGET = "shiny gold"

class One
  @relations = {} of String => Array(String)
  @flat = {} of String => Bool

  def initialize(text)
    text.each_line do |line|
      matches = line.scan(/(\w+ \w+) bag/).map &.[1]
      @relations[matches[0]] = matches[1..]
    end
  end

  def solve
    @relations.each_key.count { |key| find(key) }
  end

  def find(key)
    return @flat[key] if @flat[key]?

    if colors = @relations[key]?
      @flat[key] = TARGET.in?(colors) || colors.any? { |v| find(v) }
    end
  end
end

class Two
  @relations = {} of String => Hash(String, Int32)
  @flat = {} of String => Int32

  def initialize(text)
    text.each_line do |line|
      key = line.match(/^(\w+ \w+)/).not_nil!
      pairs = line.scan(/(?<number>\d) (?<color>\w+ \w+)/)

      @relations[key[1]] = pairs.to_h { |pair| {pair["color"], pair["number"].to_i} }
    end
  end

  def solve
    find(TARGET)
  end

  def find(key)
    return @flat[key] if @flat[key]?

    if colors = @relations[key]?
      # @flat[key] = colors[TARGET]? || colors.sum(0) { |k, v| find(k) }
      @flat[key] =
    else
      @flat[key] = 0
    end
  end
end
