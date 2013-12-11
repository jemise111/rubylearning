# c2_convert.rb
# Challenge: write code that asks for user input, then changes input from one
# temperature unit to another based on user's wishes

=begin
    doctest: Entering a temperature below absolute zero displays error message
    >> my_error = -> {convert('kelvin', 'celsius', -1)}
    >> begin ; my_error.call ; rescue ArgumentError => e ; e.class ; end
    => ArgumentError
    doctest: Entering a temperature above absolute zero returns its converted temperature
    >> convert('f', 'c', 212)
    => 100
=end
def convert unit_from, unit_to, temp
  result = to_kelvin(unit_from, temp)
  if too_low?(result)
    fail ArgumentError, "That's below Absolute Zero"
  else
    from_kelvin(unit_to, result)
  end
end

=begin
    doctest: returns a temperature in kelvin from fahrneheit 
    >> [
        [-40, 233.15],
        [32, 273.15],
        [212, 373.15],
        ].map {|q, a| to_kelvin('fahrenheit', q).round(2) == a}.all?
    => true
    doctest: returns a temperature in kelvin from celsius
    >> [
        [-40, 233.15],
        [100, 373.15],
        [50, 323.15],
        ].map {|q, a| to_kelvin('celsius', q).round(2) == a}.all?
    => true
=end
def to_kelvin unit, temp
  case unit
  when 'fahrenheit', 'f'
    (temp - 32.0) * 5 / 9 + 273.15
  when 'celsius', 'c'
    temp + 273.15
  else
    temp
  end
end

=begin
    doctest: returns a temperature in fahrenheit from kelvin 
    >> [
        [50, -369.67],
        [21, -421.87],
        [273.15, 32]
        ].map {|q, a| from_kelvin('fahrenheit', q).round(2) == a}.all?
    => true
    doctest: returns a temperature in celsius from kelvin
    >> [
        [273.15, 0],
        [250, -23.15],
        [373.15, 100],
        ].map {|q, a| from_kelvin('celsius', q).round(2) == a}.all?
    => true
=end
def from_kelvin unit, temp
  case unit
  when 'fahrenheit', 'f'
    (temp - 273.15) * 9 / 5 + 32
  when 'celsius', 'c'
    temp - 273.15
  else
    temp
  end
end

=begin
    doctest: valid units return true
    >> ['fahrenheit',
        'celsius',
        'kelvin',
        'f', 'c', 'k'
        ].map { |t| valid?(t)}.all?
    => true
=end
def valid?(unit)
 %w[fahrenheit celsius kelvin f c k].include?(unit)
end

=begin
    doctest: When the temperature in K is less than 0 it is too low
    >> too_low?(0)
    => false
    >> too_low?(-0.00001)
    => true
=end
def too_low? temp    # check if temp is below absolute zero
  temp < 0
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
    puts "%.2f degrees #{unit_from.capitalize} is %.2f degrees #{unit_to.capitalize}" % [temp.to_f, convert(unit_from, unit_to, temp.to_f)]
  else
    puts 'Sorry, that is not a valid input. Maybe check your spelling.'
  end
end
