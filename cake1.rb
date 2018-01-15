stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

def get_max_profit(input)
  lowest = input.min
  bought = input.index(lowest) + 1
  highest = input.drop(bought).max
  highest - lowest
end

p get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)
