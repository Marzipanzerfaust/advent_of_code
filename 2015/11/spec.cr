require "spec"
require "./src"

describe "valid?" do
  it "determines whether or not a password is valid" do
    valid?("hijklmmn").should be_false
    valid?("abbceffg").should be_false
    valid?("abbcegjk").should be_false
    valid?("abcdffaa").should be_true
    valid?("ghjaabcc").should be_true
  end
end

describe "solution" do
  it "part_one" do
    part_one("abcdefgh").should eq "abcdffaa"
    part_one("ghijklmn").should eq "ghjaabcc"
  end

  it "part_two" do
  end
end
