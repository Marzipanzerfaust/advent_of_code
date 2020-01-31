require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("R2, L3").should eq 5
    part_one("R2, R2, R2").should eq 2
    part_one("R5, L5, R5, R3").should eq 12
  end

  it "part_two" do
    part_two("R8, R4, R4, R8").should eq 4
  end
end
