require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    result = part_one <<-TEXT
    turn on 0,0 through 999,999
    toggle 0,0 through 999,0
    turn off 499,499 through 500,500
    TEXT

    result.should eq 1_000_000 - 1000 - 4
  end

  it "part_two" do
    part_two("turn on 0,0 through 0,0").should eq 1
    part_two("toggle 0,0 through 999,999").should eq 2_000_000
  end
end
