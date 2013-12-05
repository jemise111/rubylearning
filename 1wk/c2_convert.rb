# c2_convert.rb
# Challenge: write code that asks for user input, then changes input from one temperature unit to another based on user's wishes

puts 'Temperature Converter'
puts '---------------------'
puts 'Please enter the unit you wish to convert from, followed by'
puts 'the unit you wish to convert to, followed by the temperature'
puts 'you wish to convert, separated by single spaces.'
puts 'Your choices are Fahrenheit, Celsius, Kelvin.'
puts
print '?: '
input = gets.chomp.downcase.split
unit_from = input[0]
unit_to = input[1]
temp = input[2]
unit_choices = ['fahrenheit', 'celsius', 'kelvin']

def convert unit_from, unit_to, temp
  if is_too_low?(unit_from, temp)
    puts "That's below absolute zero. Try something a little warmer next time."
    exit
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
  
# individual conversion helper methods   
def fahrenheit_to_celsius temp_in_f
  (temp_in_f - 32) * 5 / 9
end

def celsius_to_fahrenheit temp_in_c
  temp_in_c * 9 / 5 + 32
end

def celsius_to_kelvin temp_in_c
  temp_in_c + 273.15
end

def is_too_low? unit, temp    # check if temp is below absolute zero
  case unit
  when 'fahrenheit'
    temp < -459 ? true : false
  when 'celsius'
    temp < -273 ? true : false
  when 'kelvin'
    temp < 0 ? true : false
  end
end

def inputs_valid? unit_from, unit_to, temp, unit_choices    # check if units are valid, temp is numeric
  if !unit_choices.include?(unit_from) || !unit_choices.include?(unit_to)  # could this statement be simplified?
    false
  else
    true if Float(temp) rescue false  # haven't learned this yet. is there a better way?
  end
end 
  
if inputs_valid?(unit_from, unit_to, temp, unit_choices) 
  puts "%.2f degrees #{unit_from.capitalize} is %.2f degrees #{unit_to.capitalize}" % [temp.to_f,convert(unit_from, unit_to, temp.to_f)]  
else  
  puts 'Sorry, that is not a valid input. Maybe check your spelling.'
end 
     