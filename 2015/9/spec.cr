require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    result = part_one <<-TEXT
    London to Dublin = 464
    London to Belfast = 518
    Dublin to Belfast = 141
    TEXT

    result.should eq 605
  end

  it "part_two" do
    result = part_two <<-TEXT
    London to Dublin = 464
    London to Belfast = 518
    Dublin to Belfast = 141
    TEXT

    result.should eq 982
  end
end
