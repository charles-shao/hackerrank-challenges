# First passing solution
# O(n^2) complexity

MOD = 10**9 + 7

def substrings(n)
    sum = 0
    window_idx = 0
    n.length.times do
        n.length.times do |i|
            next if (window_idx + i) > (n.length - 1)
            sum += n[i..(window_idx + i)].to_i
        end
        
        window_idx += 1
    end
    sum % MOD
end

# Alternative answer which still O(n^2) using .each_cons
def substrings(n)
    sum = 0
    n_arr = n.split("").map(&:to_i)
    1.upto(n_arr.length) do |window|
        n_arr.each_cons(window).each do |n_group|
            sum += n_group.join.to_i
        end
    end
    sum % MOD
end

# Second passing solution
# Passes all tests, O(N) complexity
def substrings(n)
    n_arr = n.split("").map(&:to_i)
    progress_sum = n_arr[0]
    sum = n_arr[0]
    1.upto(n_arr.length - 1) do |idx|
        digit = n_arr[idx]
        digit_count = idx + 1
        progress_sum = (progress_sum * 10) + (digit * digit_count)
        sum += progress_sum
    end
    
    sum % MOD
end 
