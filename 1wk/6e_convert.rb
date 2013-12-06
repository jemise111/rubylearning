# 6e_convert.rb
# Write a method to convert a temperature in degrees Fahrenheit to
# Celsius.
#    doctest: convert -40 = -40
#    >> convert(-40)
#    => -40
#    doctest: Boiling point
#    >> convert(212)
#    => 100
#    doctest: floating point error doesn't show
#    >> convert(98.6)
#    => 37

def fahrenheit_to_celsius(temp_in_fahrenheit)
  # remove extra parenthesis.
  (temp_in_fahrenheit - 32) * 5 / 9
end

alias convert fahrenheit_to_celsius

[-40, 0, 32, 98, 98.6, 100, 212].each do |f|
  puts "#{f} is equivalent to #{convert(f)} degrees celsius"
end
