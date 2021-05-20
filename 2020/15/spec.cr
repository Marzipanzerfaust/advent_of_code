require "spec"
require "./src"

describe "specs" do
  it "one" do
    one("0,3,6").should eq 436
    one("1,3,2").should eq 1
    one("2,1,3").should eq 10
    one("3,1,2").should eq 1836
  end

  it "two" do
  end
end
