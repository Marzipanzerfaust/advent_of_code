require "spec"
require "./src"

text = <<-TEXT
FBFBBFFRLR
BFFFBBFRRR
FFFBBBFRRR
BBFFBBFRLL
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 820
  end

  it "two" do
  end
end
