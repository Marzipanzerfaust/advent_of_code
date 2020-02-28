require "spec"
require "./src"

input = <<-TEXT
ULL
RRDDD
LURDL
UUUUD
TEXT

describe "solution" do
  it "part_one" do
    part_one(input).should eq "1985"
  end

  it "part_two" do
    part_two(input).should eq "5DB3"
  end
end
