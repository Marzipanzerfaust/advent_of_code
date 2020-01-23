require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("[1,2,3]").should eq 6
    part_one(%({"a":2,"b":4})).should eq 6
    part_one("[[[3]]]").should eq 3
    part_one(%({"a":{"b":4},"c":-1})).should eq 3
    part_one(%({"a":[-1,1]})).should eq 0
    part_one(%([-1,{"a":1}])).should eq 0
    part_one("[]").should eq 0
    part_one("{}").should eq 0
  end

  it "part_two" do
    part_two("[1,2,3]").should eq 6
    part_two(%([1,{"c":"red","b":2},3])).should eq 4
    part_two(%({"d":"red","e":[1,2,3,4],"f":5})).should eq 0
    part_two(%([1,"red",5])).should eq 6
  end
end
