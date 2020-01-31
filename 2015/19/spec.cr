require "spec"
require "./src"

describe "solution" do
  it "part_one" do
    input1 = <<-TEXT
    H => HO
    H => OH
    O => HH

    HOH
    TEXT

    input2 = <<-TEXT
    H => HO
    H => OH
    O => HH

    HOHOHO
    TEXT

    input3 = <<-TEXT
    A => BC
    B => CD
    A => e
    Cr => Bc
    Cr => ABAB

    AABBCr
    TEXT

    input4 = <<-TEXT
    a => bc
    a => A
    b => B
    b => cd
    c => C
    c => de
    f => sa

    AbBcCdefgfdsaaskdl
    TEXT

    part_one(input1).should eq 4
    part_one(input2).should eq 7
    part_one(input3).should eq 8
    part_one(input4).should eq 10
  end

  it "part_two" do
    input1 = <<-TEXT
    e => H
    e => O
    H => HO
    H => OH
    O => HH

    HOH
    TEXT

    input2 = <<-TEXT
    e => H
    e => O
    H => HO
    H => OH
    O => HH

    HOHOHO
    TEXT

    part_two(input1).should eq 3
    part_two(input2).should eq 6
  end
end
