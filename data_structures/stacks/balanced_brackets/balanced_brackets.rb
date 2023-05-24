# First passing solution
# Passes all tests

def isBalanced(s)
  stack = []
  stack_count = 0
  s.split("").each do |char|
      if ["(", "{", "["].include? char
          stack.push char
          stack_count += 1
      elsif char == ")"
          stack.pop if stack.last == "("
          stack_count -= 1
      elsif char == "}"
          stack.pop if stack.last == "{"
          stack_count -= 1
      elsif char == "]"
          stack.pop if stack.last == "["
          stack_count -= 1
      end
  end

  (stack_count.zero? && stack.empty?) ? "YES" : "NO"
end
