require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("ugknbfddgicrmopn").should eq 1
    part_one("aaa").should eq 1
    part_one("jchzalrnumimnmhp").should eq 0
    part_one("haegwjzuvuyypxyu").should eq 0
    part_one("dvszwmarrgswjxmb").should eq 0
  end

  it "part_two" do
    part_two("qjhvhtzxzqqjkmpb").should eq 1
    part_two("xxyxx").should eq 1
    part_two("uurcxstgmygtbstg").should eq 0
    part_two("ieodomkazucvgmuy").should eq 0
  end
end
