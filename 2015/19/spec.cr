require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    input1 = <<-TEXT
    H => HO
    H => OH
    O => HH

    HOH
    TEXT

    input2 = <<-TEXT
    H => HO
    H => OH
    O => HH

    HOHOHO
    TEXT

    part_one(input1).should eq 4
    part_one(input2).should eq 7
  end

  pending "part_two" do
  end
end
