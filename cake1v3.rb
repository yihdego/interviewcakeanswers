stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

def get_max_profit(input)
  max_profit = 0
  lowest_price = nil
  max_price = nil
  input.each do |price|
    if lowest_price == nil
      lowest_price = price
    elsif lowest_price > price
      lowest_price = price
    else
      if max_price == nil
        max_price = price
      elsif max_price < price
        max_price = price
      end
    end
  end
  max_profit = max_price - lowest_price
end

p get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)

def official_answer(input)
  min_price = input[0]
  max_profit = 0

  input.each do |current_price|
    min_price = [min_price, current_price].min
    potential_profit = current_price - min_price
    max_profit = [max_profit, potential_profit].max
  end
  max_profit
end

p official_answer(stock_prices_yesterday)
