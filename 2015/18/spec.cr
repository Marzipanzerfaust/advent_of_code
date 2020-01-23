require "spec"
require "./src"

input = <<-TEXT
.#.#.#
...##.
#....#
..#...
#.#..#
####..
TEXT

describe "solution" do
  it "part_one" do
    part_one(input, 4).should eq 4
  end

  it "part_two" do
    part_two(input, 5).should eq 17
  end
end
