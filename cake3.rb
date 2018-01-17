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
