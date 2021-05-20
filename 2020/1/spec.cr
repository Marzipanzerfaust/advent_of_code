require "spec"
require "./src"

text = <<-TEXT
1721
979
366
299
675
1456
TEXT

describe "specs" do
  it "one" do
    one(text).should eq 514579
  end

  it "two" do
    two(text).should eq 241861950
  end
end
