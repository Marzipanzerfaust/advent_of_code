def one(text)
  answers = Set(Char).new

  text.split("\n\n").sum do |group|
    answers.clear
    group.each_line &.each_char { |char| answers << char }
    next answers.size
  end
end

def two(text)
  answers = Hash(Char, Int32).new(0)

  text.split("\n\n").sum do |group|
    answers.clear

    people = group.lines
    people.each &.each_char { |char| answers[char] += 1 }

    next answers.each_value.count { |tally| tally == people.size }
  end
end
