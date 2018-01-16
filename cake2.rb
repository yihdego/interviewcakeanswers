sample = [1,7,3,4]

def get_products_of_all_ints_except_at_index(input)
  output = []
  index = 0
  input.each do |digit|
    product = 1
    nested_index = 0
    input.each do |get_product|
      if nested_index != index
        product *= get_product
      end
      nested_index += 1
    end
    output << product
    index += 1
  end
  p output
end

get_products_of_all_ints_except_at_index(sample)
