# c2_convert.rb
# Challenge: write code that asks for user input, then changes input from one
# temperature unit to another based on user's wishes
=begin
doctest: Entering a temperature below absolute zero displays error message
>> my_error = -> {convert('kelvin', 'celsius', -1)}
>> begin ; my_error.call ; rescue ArgumentError => e ; e.class ; end
=> ArgumentError
=end
def convert unit_from, unit_to, temp
  if is_too_low?(unit_from, temp)
    puts "That's below absolute zero. Try something a little warmer next time."
    fail ArgumentError, "That's below Absolute Zero"
  else
    case unit_from
    when 'fahrenheit'
      result = fahrenheit_to_celsius(temp)
      if unit_to == 'kelvin'
        result = celsius_to_kelvin(result)
      end
    when 'celsius'
      if unit_to == 'fahrenheit'
        result = celsius_to_fahrenheit(temp)
      else
        result = celsius_to_kelvin(temp)
      end
    when 'kelvin'
      result = temp - 273
      if unit_to == 'fahrenheit'
        result = celsius_to_fahrenheit(result)
      end
    end
    result
  end
end

=begin
doctest: valid units return true
>> valid? 'celsius'
=> true
>> valid? 'kelvin'
=> true
>> valid? 'fahrenheit'
=> true
=end
def valid?(unit)
 %w[fahrenheit celsius kelvin].include?(unit)
end

# individual conversion helper methods
def fahrenheit_to_celsius temp_in_f
  (temp_in_f - 32.0) * 5 / 9
end

=begin
>> [
    [-40, -40],
    [100, 212],
    [0, 32],
    [37, 98.6]
    ].map {|q, a| celsius_to_fahrenheit(q) == a}.all?
Put any comments in here that you want.  Including saying "Pay attention to
indentation for your tests, when you feel you need to break them into lines."
=> true
=end
def celsius_to_fahrenheit temp_in_c
  temp_in_c.to_f * 9 / 5 + 32
end

def celsius_to_kelvin temp_in_c
  temp_in_c + 273.15
end

=begin
doctest: When the temperature in F is less than -459 it is too low
>> is_too_low?('fahrenheit', -459)
=> false
>> is_too_low?('fahrenheit', -459.0001)
=> true
doctest: When the temperature in C is less than -273 it is too low
>> is_too_low?('celsius', -273)
=> false
>> is_too_low?('celsius', -273.0001)
=> true
doctest: When the temperature in k is less than 0 it is too low
>> is_too_low?('kelvin', 0)
=> false
>> is_too_low?('kelvin', -0.0001)
=> true
=end
def is_too_low? unit, temp    # check if temp is below absolute zero
  case unit
  when 'fahrenheit'
    temp < -459
  when 'celsius'
    temp < -273
  when 'kelvin'
    temp < 0
  end
end


if __FILE__ == $PROGRAM_NAME
  puts 'Temperature Converter'
  puts '---------------------'
  puts 'Please enter the unit you wish to convert from, followed by'
  puts 'the unit you wish to convert to, followed by the temperature'
  puts 'you wish to convert, separated by single spaces.'
  puts 'Your choices are Fahrenheit, Celsius, Kelvin.'
  puts
  print '?: '
  input     = gets.chomp.downcase.split
  unit_from = input[0]
  unit_to   = input[1]
  temp      = input[2]
  valid     = [unit_from, unit_to].all? {|u| valid?(u) }

  if valid
    puts "%.2f degrees #{unit_from.capitalize} is %.2f degrees #{unit_to.capitalize}" % [temp.to_f,convert(unit_from, unit_to, temp.to_f)]
  else
    puts 'Sorry, that is not a valid input. Maybe check your spelling.'
  end
end
