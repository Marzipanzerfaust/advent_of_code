require "spec"
require "./src"

text = <<-TEXT
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 7
  end

  it "two" do
    two(text).should eq 336
  end
end
