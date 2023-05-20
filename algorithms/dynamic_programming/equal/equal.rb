# First passing solution
# Passes all test cases (0 - 15)

def equal(arr)
  possibilities = []
  minimum = arr.min

  4.times do |i|
      arr.each do |n|
          diff = n - minimum
          steps = (diff / 5) + ((diff % 5) / 2) + (((diff % 5) % 2) / 1)
          if possibilities[i].nil?
              possibilities[i] = steps
          else
              possibilities[i] += steps
          end
      end
      minimum -= 1
  end

  p possibilities.min
end
