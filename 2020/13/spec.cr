require "spec"
require "./src"

text = <<-TEXT
939
7,13,x,x,59,x,31,19
TEXT

_one = <<-TEXT
939
17,x,13,19
TEXT

_two = <<-TEXT
939
67,7,59,61
TEXT

_three = <<-TEXT
939
67,x,7,59,61
TEXT

_four = <<-TEXT
939
67,7,x,59,61
TEXT

_five = <<-TEXT
939
1789,37,47,1889
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 295
  end

  it "two" do
    two(text).should eq 1068781
    two(_one).should eq 3417
    two(_two).should eq 754018
    two(_three).should eq 779210
    two(_four).should eq 1261476
    two(_five).should eq 1202161486
  end
end
