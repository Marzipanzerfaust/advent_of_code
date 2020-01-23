require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    inputs = %w[
      (()) ()()
      ((( (()(()(
      ))(((((
      ()) ))(
      ))) )())())
    ]

    outputs = [
      0, 0,
      3, 3,
      3,
      -1, -1,
      -3, -3
    ]

    inputs.zip(outputs).each do |i, o|
      part_one(i).should eq o
    end
  end

  it "part_two" do
    part_two(")").should eq 1
    part_two("()())").should eq 5
  end
end
