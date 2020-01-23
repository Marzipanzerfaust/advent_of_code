require "bit_array"

struct Grid
  @width : Int32

  @curr : BitArray
  @next : BitArray

  @curr_as_slice : Bytes
  @next_as_slice : Bytes

  def initialize(input : String)
    rows = input.lines

    @width = rows.size

    @curr = BitArray.new(@width ** 2)
    @curr_as_slice = @curr.to_slice

    @next = BitArray.new(@width ** 2)
    @next_as_slice = @next.to_slice

    rows.each.with_index do |row, i|
      row.each_char.with_index do |cell, j|
        @curr[i * @width + j] = cell == '#'
      end
    end
  end

  def step(n = 1)
    n.times do
      @width.times do |i|
        @width.times do |j|
          total_on = neighbors(j, i).count(true)

          idx = i * @width + j

          if @curr[idx] == true
            @next[idx] = total_on == 2 || total_on == 3
          else
            @next[idx] = total_on == 3
          end
        end
      end

      @next_as_slice.copy_to(@curr_as_slice)
    end
  end

  def count : Int32
    @curr.count(true)
  end

  def to_s(io : IO)
    @width.times do |i|
      @width.times do |j|
        idx = i * @width + j

        io << @curr[idx] ? '#' : '.'
      end

      io << '\n'
    end
  end

  private def neighbors(x : Int, y : Int) : Array(Bool)
    neighbor_idxs = {
      {x-1, y-1}, {x  , y-1}, {x+1, y-1},
      {x-1, y  },             {x+1, y  },
      {x+1, y-1}, {x+1, y  }, {x+1, y+1}
    }

    return neighbor_idxs
      .select { |x, y| 0 <= x < @width && 0 <= y < @width }
      .map { |x, y| @curr[y * @width + x] }
  end
end











def __icr_exec__
  input = <<-TEXT
.#.#.#
...##.
#....#
..#...
#.#..#
####..
TEXT

  input
  ...##.
  #....#
  ..#...
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"