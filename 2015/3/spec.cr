require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one(">").should eq 2
    part_one("^>v<").should eq 4
    part_one("^v^v^v^v^v").should eq 2
  end

  it "part_two" do
    part_two("^v").should eq 3
    part_two("^>v<").should eq 3
    part_two("^v^v^v^v^v").should eq 11
  end
end
