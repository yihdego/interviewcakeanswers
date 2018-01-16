sample = [7, 1, 3, 2, 5]
second_sample = [8, 8, 9, 1]
third_sample = [-10, -10, 1, 3, 2,]

def find_highest_product_of_three (array_of_ints)
  big_three = []
  for i in 0..2
    largest = array_of_ints.max
    big_three << array_of_ints.delete_at(array_of_ints.index(largest) || array_of_ints.length)
  end
  p big_three.reduce(:*)
end

find_highest_product_of_three(sample)
find_highest_product_of_three(second_sample)
find_highest_product_of_three(third_sample)
