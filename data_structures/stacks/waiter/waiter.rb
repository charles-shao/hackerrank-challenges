# Passes all tests

def waiter(number, q)
  # Prime numbers to the qth number
  prime_numbers = Prime.first(q)
  a_arr = []
  answers = []
  remainder = number

  prime_numbers.each do |pn|
      a_arr = []
      b_arr = []
      (remainder.length - 1).downto(0) do |index|
          if remainder[index] % pn == 0
              b_arr.push(remainder[index])
          else
              a_arr.push(remainder[index])
          end
      end

      while b_arr.length > 0
          answers.push(b_arr.pop())
      end

      remainder = a_arr
  end

  while a_arr.length > 0
      answers.push(a_arr.pop())
  end

  answers
end
