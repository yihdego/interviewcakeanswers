def change_possibilities_top_down(amount_left, denominations, current_index=0)

  # base cases:
  # we hit the amount spot on. yes!
  return 1 if amount_left == 0

  # we overshot the amount left (used too many coins)
  return 0 if amount_left < 0

  # we're out of denominations
  return 0 if current_index == denominations.length

  puts "checking ways to make #{amount_left} with #{denominations[current_index..-1]}"

  # choose a current coin
  current_coin = denominations[current_index]

  # see how many possibilities we can get
  # for each number of times to use current_coin
  num_possibilities = 0
  while amount_left >= 0
    num_possibilities += change_possibilities_top_down(amount_left, denominations, current_index + 1)
    amount_left -= current_coin
  end

  return num_possibilities
end

change_possibilities_top_down(4, [1,2,3])
