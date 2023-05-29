def beautifulQuadruples(a, b, c, d)
  # Sort inputs in asc order since where the numbers occur don't matter
  a, b, c, d = [a, b, c, d].sort
  # a ^ b ^ c ^ d != 0
  # Alternatively condition fails if a ^ b = c ^ d

  # Constraint where 1 <= a, b, c, d <= 3000
  # 2**12 yields 4098 which should cover all
  # XOR cases
  quadruples = Array.new(2**12, 0)

  count = 0
  total = 0

  1.upto(c) do |y|
      y.upto(d) do |z|
          quadruples[y ^ z] += 1
          total += 1
      end
  end

  1.upto(b) do |x|
      1.upto([a, x].min) do |w|
          count += total - quadruples[x ^ w]
      end
      # Remove duplicates
      x.upto(d) do |k|
          quadruples[x ^ k] -= 1
          total -= 1
      end
  end

  count
end
