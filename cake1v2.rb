stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

def get_max_profit(input)
  max_profit = 0
  input.each_with_index do |earlier_price, earlier_time|
    (input[earlier_time+1..-1]).each do |later_price|
      potential_profit = later_price - earlier_price

      max_profit = [max_profit, potential_profit].max
    end
  end
  max_profit
end

p get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)
