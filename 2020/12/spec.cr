require "spec"
require "./src"

text = <<-TEXT
F10
N3
F7
R90
F11
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 25
  end

  it "two" do
    two(text).should eq 286
  end
end
