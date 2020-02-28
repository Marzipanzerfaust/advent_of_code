require "spec"
require "./src"

input = <<-TEXT
eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
TEXT

describe "solution" do
  it "part_one" do
    part_one(input).should eq "easter"
  end

  it "part_two" do
    part_two(input).should eq "advent"
  end
end
