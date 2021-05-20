require "spec"
require "./src"

text1 = <<-TEXT
16
10
15
5
1
11
7
19
6
12
4
TEXT

text2 = <<-TEXT
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
TEXT

describe "specs" do
  it "one" do
    one(text1).should eq 35
    one(text2).should eq 220
  end

  it "two" do
    two(text1).should eq 8
    two(text2).should eq 19208
  end
end
