require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("50").should eq 4
    part_one("100").should eq 6
    part_one("150").should eq 8
    part_one("14000").should eq 480
    part_one("140000").should eq 3960
    part_one("1400000").should eq 36960
    part_one("34000000").should eq 786240
  end

  it "part_two" do
  end
end
