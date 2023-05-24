# First passing solution, brute force n^2
# Fails time checks
def arrayManipulation(n, queries)
  arr = Array.new(n + 1, 0)
  queries.each do |a, b, k|
     a.upto(b) { |index| arr[index] += k }
  end

  arr.max
end

# Second solution, never would have figured it out myself.
def arrayManipulation(n, queries)
  # 1-indexed array
  arr = Array.new(n + 1, 0)
  queries.each do |a, b, k|
      arr[a - 1] += k
      arr[b] -= k
  end

  max = 0
  arr.inject(0) do |acc, n|
      acc += n
      max = acc if acc > max
      acc
  end

  max
end
