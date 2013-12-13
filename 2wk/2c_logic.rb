# 2c_logic.rb
# Rewrite the following code as if the ternary operator did not exist

puts 5 > 3 ? "yeah" : "boo"
puts 5 < 3 ? "yeah" : "boo"

# rewrite:

puts 5 > 3 && "yeah" || "boo"
puts 5 < 3 && "yeah" || "boo"
