require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    input = <<-TEXT
    Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
    Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
    TEXT

    part_one(input, 1000).should eq 1120
  end

  it "part_two" do
    input = <<-TEXT
    Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
    Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
    TEXT

    part_two(input, 1000).should eq 689
  end
end
