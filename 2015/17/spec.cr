require "spec"
require "./src"

input = <<-TEXT
20
15
10
5
5
TEXT

describe "solution" do
  it "part_one" do
    part_one(input, 25).should eq 4
  end

  it "part_two" do
    part_two(input, 25).should eq 3
  end
end
