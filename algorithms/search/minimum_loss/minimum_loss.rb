# First passing solution
# Brute force approach, fails time checks
def minimumLoss(price)
  min_loss = 10**16
  price.combination(2) do |price_point|
      next if price_point[1] > price_point[0]
      loss = price_point[0] - price_point[1]
      min_loss = [loss, min_loss].min
  end
  min_loss
end

# Passes all tests
# Sorts the array and keeps track of the index of the values when
# calculating minimum loss
def minimumLoss(price)
  min_loss = 10**16

  sorted_price_with_indices = price.map.with_index do |p, i|
      [p, i]
  end.sort_by { |pair| pair[0] }

  sorted_price_with_indices.length.times do |n|
      next if n == (sorted_price_with_indices.length - 1)
      current_price, current_index = sorted_price_with_indices[n]
      next_price, next_index = sorted_price_with_indices[n + 1]
      loss = next_price - current_price
      if current_index > next_index
          min_loss = [loss, min_loss].min
      end
  end

  min_loss
end
