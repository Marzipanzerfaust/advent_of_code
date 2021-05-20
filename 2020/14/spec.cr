require "spec"
require "./src"

_one = <<-TEXT
mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0
TEXT

_two = <<-TEXT
mask = 000000000000000000000000000000X1001X
mem[42] = 100
mask = 00000000000000000000000000000000X0XX
mem[26] = 1
TEXT

describe "specs" do
  it "one" do
    one(_one).should eq 165
  end

  it "two" do
    two(_two).should eq 208
  end
end
