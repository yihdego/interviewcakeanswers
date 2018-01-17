sample = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

def merge_ranges(input)

end

merge_ranges(sample)

two_ranges = [[1,3],[2,4]]

def one_pair(input)
  sorted = input.sort
  output = sorted.shift
  if input[0].min < input[1].min
    a = input[0]
    b = input[1]
  else
    a = input[1]
    b = input[0]
  end
  if b.min > a.min && b.min < a.max
    if b.max > a.max
      output = [a.min, b.max]
    else
      output = [a.min, b.max]
    end
  end
  p output
end

one_pair(two_ranges)
