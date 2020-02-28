require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    input = <<-TEXT
    aaaaa-bbb-z-y-x-123[abxyz]
    a-b-c-d-e-f-g-h-987[abcde]
    not-a-real-room-404[oarel]
    totally-real-room-200[decoy]
    TEXT

    part_one(input).should eq 1514
  end

  pending "part_two" do
  end
end
