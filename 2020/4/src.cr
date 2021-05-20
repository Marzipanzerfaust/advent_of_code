def one(text)
  text.split("\n\n").count do |passport|
    passport.scan(/([[:alpha:]]{3}):/).count { |m| m[1] != "cid" } == 7
  end
end

def two(text)
  re = %r(
    ([bie]yr):(\d{4}) |
    (hgt):(\d+)(cm|in) |
    (hcl):.[[:xdigit:]]{6} |
    (ecl):(?:amb|blu|brn|gry|grn|hzl|oth) |
    (pid):\d{9}
  )x

  # width = 30

  # log = String::Builder.new

  text.split("\n\n").count do |passport|
    # log << "=" * width * 2 << '\n'
    # log << passport << '\n'
    # log << "-" * width << '\n'

    count = 0

    valid = passport.scan(re).count do |m|
      count += 1
      # log << m << '\n'
      # log << "-" * width << '\n'

      if m[1]?
        year = m[2].to_i

        case m[1]
        when "byr"
          1920 <= year <= 2002
        when "iyr"
          2010 <= year <= 2020
        when "eyr"
          2020 <= year <= 2030
        end
      elsif m[3]?
        height = m[4].to_i

        case m[5]
        when "cm" then 150 <= height <= 193
        when "in" then 59 <= height <= 76
        end
      elsif m[6]? || m[7]? || m[8]?
        true
      end
    end

    # log << valid << '\n'
    puts passport if count > 8
    next valid == 7
  end

  # puts log.to_s
end
