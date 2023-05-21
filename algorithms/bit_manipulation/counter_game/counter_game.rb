# First passing solution

def counterGame(n)
  remainder = n
  counter = 0 # Louise wins if it ends on even turn

  while remainder > 0
      binary_number = remainder.to_s(2)
      if binary_number.count("1") == 1
          remainder = binary_number.to_i(2) >> 1
          counter += 1
      else
          remainder = binary_number.sub("1", "0").to_i(2)
          counter += 1
      end
  end

  p counter.even? ? "Louise" : "Richard"
end
