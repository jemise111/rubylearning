# 1e_operator_precedence.rb
# Guess the result of the code below
# My guess:  
# => true  (incorrect) (remember assignment occurs before "or")
# => false (correct)
# => true  (correct)

y = false
z = true
x = y or z
puts x 
(x = y) or z
puts x 
x = (y or z)
puts x