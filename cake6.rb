my_rectangle = {

  # coordinates of bottom-left corner
  'left_x' => 1,
  'bottom_y' => 1,

  # width and height
  'width' => 6,
  'height' => 3,

}

her_rectangle = {

  # coordinates of bottom-left corner
  'left_x' => 5,
  'bottom_y' => 2,

  # width and height
  'width' => 3,
  'height' => 6,

}
#
# def find_overlap(my_rectangle, her_rectangle)
  # love_rectangle = {
  #   # coordinates of bottom-left corner
  #   'left_x' => nil,
  #   'bottom_y' => nil,
  #
  #   # width and height
  #   'width' => nil,
  #   'height' => nil,
  # }
#
#   output
# end

def find_overlap(rectangle_one, rectangle_two)
  width_one = find_width(rectangle_one)
  width_two = find_width(rectangle_two)
  height_one = find_height(rectangle_one)
  height_two = find_height(rectangle_two)
  overlap_x = find_x_overlap(width_one, width_two)
  overlap_y = find_y_overlap(height_one, height_two)
  love_rectangle = {
    # coordinates of bottom-left corner
    'left_x' => overlap_x.min,
    'bottom_y' => overlap_y.min,

    # width and height
    'width' => overlap_x.max - overlap_x.min,
    'height' => overlap_y.max - overlap_y.min,
  }
end

def find_width(rectangle)
  [rectangle["left_x"], (rectangle["left_x"]+rectangle["width"])]
end

def find_height(rectangle)
  [rectangle["bottom_y"], (rectangle["bottom_y"]+rectangle["height"])]
end

def find_x_overlap(width_one, width_two)
  if width_one.min < width_two.min
    if width_one.max > width_two.min
      if width_one.max <= width_two.max
        return [width_two.min, width_one.max]
      else
        return [width_two.min, width_two.max]
      end
    end
  else
    if width_two.max > width_one.min
      if width_one.max <= width_two.max
        return [width_one.min, width_one.max]
      else
        return [width_one.min, width_two.max]
      end
    end
  end
end

def find_y_overlap(height_one, height_two)
  if height_one.min < height_two.min
    if height_one.max > height_two.min
      if height_one.max <= height_two.max
        return [height_two.min, height_one.max]
      else
        return [height_two.min, height_two.max]
      end
    end
  else
    if height_two.max > height_one.min
      if height_one.max <= height_two.max
        return [height_one.min, height_one.max]
      else
        return [height_one.min, height_two.max]
      end
    end
  end
end

p find_y_overlap([1,7],[5,8])
p find_y_overlap([1,3],[1,6])

p find_overlap(my_rectangle, her_rectangle)
