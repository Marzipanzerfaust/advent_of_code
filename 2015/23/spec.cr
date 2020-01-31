require "spec"
require "./src"

input = <<-TEXT
inc a
jio a, +2
tpl a
inc a
TEXT

describe "solution" do
  it "part_one" do
    part_one(input).should eq({2, 0})
  end

  it "part_two" do
    part_two(input).should eq({7, 0})
  end
end
