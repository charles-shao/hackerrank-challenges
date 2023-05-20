# First passing solution
# Brute force with O(n^2) complexity, fails time checks

MOD = 10**9 + 7

def countArray(n, k, x)
  count = 0
  inclusive_k = (1..k).to_a
  # start and end excluded
  window = n - 2
  inclusive_k.repeated_permutation(window) do |permutation|
      next if permutation.first == 1
      next if permutation.last == x
      next if permutation.each_cons(2).any? { |a, b| (a <=> b) == 0}
      count += 1
  end

  count % MOD
end
