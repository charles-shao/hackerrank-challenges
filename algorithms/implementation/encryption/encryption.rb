# First passing solution
# Passes all test cases

def encryption(s)
  text = s.gsub(/\s+/, "").split("")
  text_length = text.length
  column_length = (text_length**(1.0 / 2)).ceil

  processed_text = []
  text.each_slice(column_length) do |sliced_text|
      processed_text << sliced_text
  end

  last_row = processed_text.last
  if last_row.length != column_length
      last_row.length.upto(column_length - 1) do
          last_row.push("")
      end
  end

  processed_text.transpose.map(&:join).join(" ")
end
