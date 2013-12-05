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
    (temp_in_fahrenheit - 32) / 9 * 5
  end

alias convert fahrenheit_to_celsius

f_temp = 212
puts "#{f_temp} is equivalent to #{convert(f_temp).round(2)} degrees celsius"
