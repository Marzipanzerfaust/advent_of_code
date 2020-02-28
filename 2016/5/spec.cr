require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("abc").should eq "18f47a30"
  end

  it "part_two" do
    part_two("abc").should eq "05ace8e3"
  end
end
