def part_one(input)
  input.each_line.sum do |line|
    l, w, h = line.split('x').map(&.to_i)
    areas = {l*w, w*h, h*l}

    2*l*w + 2*w*h + 2*h*l + areas.min
  end
end

def part_two(input)
  input.each_line.sum do |line|
    l, w, h = line.split('x').map(&.to_i)
    perimeters = {2*l + 2*w, 2*w + 2*h, 2*h + 2*l}

    {l, w, h}.product + perimeters.min
  end
end
