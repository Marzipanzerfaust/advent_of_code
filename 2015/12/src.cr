require "json"

def part_one(input)
  json = JSON.parse(input)

  return json_ints(json).sum
end

def part_two(input)
  json = JSON.parse(input)

  return json_ints(json, ignore: "red").sum
end

# For reference:
def ints(x, result = [] of Int32) : Array(Int32)
  case x
  when Int
    result << x
  when Array
    x.each { |y| ints(y, result) }
  when Hash
    x.each_value { |y| ints(y, result) }
  end

  return result
end

def json_ints(x : JSON::Any, result = [] of Int32, ignore = nil) : Array(Int32)
  case x
  when .as_i?
    result << x.as_i
  when .as_a?
    x.as_a.each { |y| json_ints(y, result, ignore) }
  when .as_h?
    x = x.as_h

    # Don't process this hash if it contains `ignore` as a value
    if ignore && x.has_value?(ignore)
      return result
    end

    x.each_value { |y| json_ints(y, result, ignore) }
  end

  return result
end
