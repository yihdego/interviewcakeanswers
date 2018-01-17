sample = [7, 1, 3, 2, 5]
second_sample = [8, 8, 9, 1]
third_sample = [-10, -10, 1, 3, 2,]

# def find_highest_product_of_three (array_of_ints)
#   big_three = []
#   for i in 0..2
#     largest = array_of_ints.max
#     big_three << array_of_ints.delete_at(array_of_ints.index(largest) || array_of_ints.length)
#   end
#   p big_three.reduce(:*)
# end



# find_highest_product_of_three(sample)
# find_highest_product_of_three(second_sample)
# find_highest_product_of_three(third_sample)

def find_biggest_product_of_three(input)
  highest_product_o_3 = (input[0] * input[1] * input[2])
  a = input.shift
  b = input.shift
  highest = nil
  lowest = nil
  if a > b
    highest = a
    lowest = b
  else
    highest = b
    lowest = a
  end
  highest_product_o_2 = (a * b)
  highest = a
  lowest_product_o_2 = highest_product_o_2
  lowest = b
  input.each do |number|
    if (number * highest_product_o_2) > highest_product_o_3
      highest_product_o_3 = (number * highest_product_o_2)
    elsif (number * lowest_product_o_2) > highest_product_o_3
      highest_product_o_3 = (number * lowest_product_o_2)
    end
    if (number * highest) > highest_product_o_2
      highest_product_o_2 = (number * highest)
    elsif (number * lowest) < lowest_product_o_2
      lowest = number
    end
    if number > highest
      highest = number
    elsif number < lowest
      lowest = number
    end
  end
  p highest_product_o_3
end

find_biggest_product_of_three(sample)
find_biggest_product_of_three(second_sample)
find_biggest_product_of_three(third_sample)

def highest_product_of_3(array_of_ints)

if array_of_ints.length < 3
  raise Exception, 'Less than 3 items!'
end

# we're going to start at the 3rd item (at index 2)
# so pre-populate highests and lowests based on the first 2 items.
# we could also start these as nil and check below if they're set
# but this is arguably cleaner
highest = [array_of_ints[0], array_of_ints[1]].max
lowest =  [array_of_ints[0], array_of_ints[1]].min

highest_product_of_2 = array_of_ints[0] * array_of_ints[1]
lowest_product_of_2  = array_of_ints[0] * array_of_ints[1]

# except this one--we pre-populate it for the first *3* items.
# this means in our first pass it'll check against itself, which is fine.
highest_product_of_3 = array_of_ints[0] * array_of_ints[1] * array_of_ints[2]

# walk through items, starting at index 2
# (we could slice the array but that would use n space)
array_of_ints.each_with_index do |current, index|
  next if index < 2

  # do we have a new highest product of 3?
  # it's either the current highest,
  # or the current times the highest product of two
  # or the current times the lowest product of two
  highest_product_of_3 = [
    highest_product_of_3,
    current * highest_product_of_2,
    current * lowest_product_of_2
  ].max

  # do we have a new highest product of two?
  highest_product_of_2 = [
    highest_product_of_2,
    current * highest,
    current * lowest
  ].max

  # do we have a new lowest product of two?
  lowest_product_of_2 = [
    lowest_product_of_2,
    current * highest,
    current * lowest
  ].min

  # do we have a new highest?
  highest = [highest, current].max

  # do we have a new lowest?
  lowest = [lowest, current].min
end

return highest_product_of_3
end
