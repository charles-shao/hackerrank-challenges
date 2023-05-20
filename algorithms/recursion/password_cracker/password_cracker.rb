# First passing solution
# Passes tests 1 - 18
# Fails tests 19 - 35
def passwordCracker(passwords, login_attempt)
    scanned_matches = []
  
    # Mask answers when a substring matches
    attempt_mask = login_attempt.dup
    passwords.each do |password|
        starting_index = 0
        while login_attempt.length >= (starting_index + password.length)
            index = attempt_mask.index(/#{password}/, starting_index)
            break if index.nil?
            attempt_mask[index..(index + password.length - 1)] = "*" * password.length
            scanned_matches << { word: password, start_index: index, end_index: index + password.length }
            starting_index = index + password.length
        end
    end
    
    sorted_scan = scanned_matches.sort_by { |match| match[:start_index] }
    password_result = sorted_scan.map { |match| match[:word] }

    if password_result.join.length == login_attempt.length
        password_result.join(" ")
    else
        "WRONG PASSWORD"
    end
end
