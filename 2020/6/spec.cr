require "spec"
require "./src"

text1 = <<-TEXT
abcx
abcy
abcz
TEXT

text2 = <<-TEXT
abc

a
b
c

ab
ac

a
a
a
a

b
TEXT

describe "specs" do
  it "one" do
    one(text1).should eq 6
    one(text2).should eq 11
  end

  it "two" do
    two(text2).should eq 6
  end
end
