class CPU
  getter a = 0
  getter b = 0

  getter addr = 0

  getter rom = [] of String

  getter jumped = false

  def load_rom(input : String) : Nil
    @rom = input.lines
  end

  def run : Nil
    loop do
      step
      break if @addr >= @rom.size
    end
  end

  def step : Nil
    op(@rom[@addr])

    if @jumped
      @jumped = false
    else
      @addr += 1
    end
  end

  def op(instruction : String) : Nil
    case instruction
    when "hlf a"
      @a //= 2
    when "hlf b"
      @b //= 2
    when "tpl a"
      @a *= 3
    when "tpl b"
      @b *= 3
    when "inc a"
      @a += 1
    when "inc b"
      @b += 1
    when /jmp ([+-]\d+)/
      jump($1.to_i)
    when /jie a, ([+-]\d+)/
      jump($1.to_i) if @a.even?
    when /jie b, ([+-]\d+)/
      jump($1.to_i) if @b.even?
    when /jio a, ([+-]\d+)/
      jump($1.to_i) if @a == 1
    when /jio b, ([+-]\d+)/
      jump($1.to_i) if @b == 1
    end
  end

  def jump(n : Int) : Nil
    @addr += n
    @jumped = true
  end
end

def part_one(input)
  cpu = CPU.new
  cpu.load_rom(input)
  cpu.run

  return cpu.a, cpu.b
end

def part_two(input)
  cpu = CPU.new
  cpu.load_rom(input)
  cpu.op("inc a")
  cpu.run

  return cpu.a, cpu.b
end
