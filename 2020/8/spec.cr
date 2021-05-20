require "spec"
require "./src"

text = <<-TEXT
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 5
  end

  it "two" do
    two(text).should eq 8
  end
end
