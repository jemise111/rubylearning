# 6e_convert.rb
# Write a method to convert a temperature in degrees Fahrenheit to 
# Celsius.

def fahrenheit_to_celsius temp_in_fahrenheit
  ((temp_in_fahrenheit - 32) / 1.8)
end

alias convert fahrenheit_to_celsius

f_temp = 150
puts "#{f_temp} is equivalent to #{convert(f_temp).round(2)} degrees celsius"