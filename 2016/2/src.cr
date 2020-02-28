struct Keypad
  KEYS = [
    "123",
    "456",
    "789"
  ]

  def initialize(@x = 1, @y = 1)
  end

  def up!
    @y -= 1 unless @y == 0
  end

  def right!
    @x += 1 unless @x == 2
  end

  def down!
    @y += 1 unless @y == 2
  end

  def left!
    @x -= 1 unless @x == 0
  end

  def digit
    KEYS[@y][@x]
  end
end

def part_one(input)
  keypad = Keypad.new

  String.build do |str|
    input.each_line do |line|
      line.each_char do |char|
        case char
        when 'U' then keypad.up!
        when 'R' then keypad.right!
        when 'D' then keypad.down!
        when 'L' then keypad.left!
        end
      end

      str << keypad.digit
    end
  end
end

struct KeypadHex
  KEYS = [
    "  1  ",
    " 234 ",
    "56789",
    " ABC ",
    "  D  "
  ]

  def initialize(@x = 0, @y = 2)
  end

  def up!
    case @x
    when 1, 3
      @y -= 1 unless @y == 1
    when 2
      @y -= 1 unless @y == 0
    end
  end

  def right!
    case @y
    when 1, 3
      @x += 1 unless @x == 3
    when 2
      @x += 1 unless @x == 4
    end
  end

  def down!
    case @x
    when 1, 3
      @y += 1 unless @y == 3
    when 2
      @y += 1 unless @y == 4
    end
  end

  def left!
    case @y
    when 1, 3
      @x -= 1 unless @x == 1
    when 2
      @x -= 1 unless @x == 0
    end
  end

  def digit
    KEYS[@y][@x]
  end
end

def part_two(input)
  keypad = KeypadHex.new

  String.build do |str|
    input.each_line do |line|
      line.each_char do |char|
        case char
        when 'U' then keypad.up!
        when 'R' then keypad.right!
        when 'D' then keypad.down!
        when 'L' then keypad.left!
        end
      end

      str << keypad.digit
    end
  end
end
