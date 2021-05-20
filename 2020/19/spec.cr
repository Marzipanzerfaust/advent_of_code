require "spec"
require "./src"

text = <<-TEXT
0: 4 1 5
1: 2 3 | 3 2
2: 4 4 | 5 5
3: 4 5 | 5 4
4: "a"
5: "b"

ababbb
bababa
abbbab
aaabbb
aaaabbb
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 2
  end

  it "two" do
  end
end
