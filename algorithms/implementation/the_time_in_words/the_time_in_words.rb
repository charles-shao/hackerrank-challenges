# First passing solution
# Passes all test cases (0 - 10)

def timeInWords(h, m)
    wordbank = {
        "1" => "one", 
        "2" => "two", 
        "3" => "three", 
        "4" => "four", 
        "5" => "five", 
        "6" => "six", 
        "7" => "seven", 
        "8" => "eight", 
        "9" => "nine", 
        "10" => "ten", 
        "11" => "eleven", 
        "12" => "twelve", 
        "13" => "thirteen",
        "14" => "fourteen",
        "16" => "sixteen",
        "17" => "seventeen",
        "18" => "eighteen",
        "19" => "nineteen",
        "20" => "twenty"
    }
    
    time_in_words = []
    pluralized_minute = -> (min) { min == 1 ? "minute" : "minutes" }
    if m == 0
        time_in_words << "#{wordbank[h.to_s]} o' clock" 
    elsif m.between?(1, 30)
        if m == 15
            time_in_words << "quarter" 
        elsif m == 30
            time_in_words << "half"
        elsif m <= 20
            time_in_words << "#{wordbank[m.to_s]} #{pluralized_minute.call(m)}"
        else
            time_in_words << "twenty #{wordbank[m.to_s.split("").last]} #{pluralized_minute.call(m)}"
        end
        time_in_words << "past"
        time_in_words << wordbank[h.to_s]
    elsif m > 30
        if m == 45 
            time_in_words << "quarter"
        elsif m.between?(31, 39)
            time_in_words << "twenty #{wordbank[(30 - m).abs.to_s.split("").last]} #{pluralized_minute.call(30 - m)}"
        else
            time_in_words << "#{wordbank[(60 - m).abs.to_s]} #{pluralized_minute.call(60 - m)}"
        end
        time_in_words << "to"
        hour_to = h + 1 > 12 ? 1 : h + 1
        time_in_words << wordbank[hour_to.to_s]
    end
    
    time_in_words.join(" ")
end
