# 2e_format_string.rb
# Guess the result of the code below
# My guess:
# => 00123 (correct)
# why? "%05d" is saying "convert argument to a decimal number 
# with width = 5 and instead of padding with spaces pad with 0's."

puts "%05d" % 123