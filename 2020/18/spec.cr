require "spec"
require "./src"

text = <<-TEXT
2 * 3 + (4 * 5)
5 + (8 * 3 + 9 + 3 * 4 * 3)
5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))
((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2
TEXT

describe "specs" do
  it "one" do
    one(text).should eq (26 + 437 + 12240 + 13632)
  end

  it "two" do
  end
end
