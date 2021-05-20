require "spec"
require "./src"

text = <<-TEXT
L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 37
  end

  it "two" do
    two(text).should eq 26
  end
end
