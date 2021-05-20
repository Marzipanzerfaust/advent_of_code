def one(text)
  text.each_line.count do |line|
    line =~ /(\d+)-(\d+) ([[:alpha:]]): ([[:alpha:]]+)/
    $1.to_i <= $4.count($3) <= $2.to_i
  end
end

def two(text)
  text.each_line.count do |line|
    line =~ /(\d+)-(\d+) ([[:alpha:]]): ([[:alpha:]]+)/
    a, b = $4[$1.to_i - 1], $4[$2.to_i - 1]
    c = $3[0]
    a == c && b != c || a != c && b == c
  end
end
