require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("1").should eq "11"
    part_one("11").should eq "21"
    part_one("21").should eq "1211"
    part_one("1211").should eq "111221"
    part_one("111221").should eq "312211"

    part_one("1", 5).should eq "312211"
  end

  it "part_two" do
  end
end
