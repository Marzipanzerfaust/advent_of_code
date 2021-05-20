require "spec"
require "./src"

text = <<-TEXT
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
TEXT

describe "specs" do
  it "one" do
    one(text, 5).should eq 127
  end

  it "two" do
    two(text, 5).should eq 62
  end
end
