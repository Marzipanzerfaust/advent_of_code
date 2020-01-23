require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    input = <<-TEXT
    Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
    Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
    TEXT

    part_one(input).should eq 62842880
  end

  pending "part_two" do
  end
end
