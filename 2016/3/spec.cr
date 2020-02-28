require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    part_one("5 10 25").should eq 0
  end

  it "part_two" do
    input = <<-TEXT
    101 301 501
    102 302 502
    103 303 503
    201 401 601
    202 402 602
    203 403 603
    TEXT

    part_two(input).should eq 6
  end
end
