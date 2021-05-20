require "spec"
require "./src"

text = <<-TEXT
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 2
  end

  it "two" do
    two(text).should eq 1
  end
end
