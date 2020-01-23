require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("2x3x4").should eq 58
    part_one("1x1x10").should eq 43
  end

  it "part_two" do
    part_two("2x3x4").should eq 34
    part_two("1x1x10").should eq 14
  end
end
