require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one(%q("")).should eq 2
    part_one(%q("abc")).should eq 2
    part_one(%q("aaa\"aaa")).should eq 3
    part_one(%q("\x27")).should eq 5
  end

  it "part_two" do
    part_two(%q("")).should eq 4
    part_two(%q("abc")).should eq 4
    part_two(%q("aaa\"aaa")).should eq 6
    part_two(%q("\x27")).should eq 5
  end
end
