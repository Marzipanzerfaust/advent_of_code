require "spec"
require "./src"

text = <<-TEXT
.#.
..#
###
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 112
  end

  it "two" do
  end
end
