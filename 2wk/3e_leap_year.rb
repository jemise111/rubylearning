# leap_year.rb
# Write a method leap_year? that checks if a given year is a leap year. Then calculate number of
# minutes in a leap year and a non leap year.

=begin
doctest: return true if a year is a leap year
>> [-400, -1896, -2000, 400, 1896, 2000].map { |y| leap_year?(y) }.all?
=> true
doctest: return false if a year is not a leap year
>> [-300, -1900, -2001, 300, 1900, 2001].map { |y| leap_year?(y) }.all?
=> false
doctest: return error string if a year isn't valid
>> [0, 'cat'.to_i].map { |y| leap_year?(y) }.all?
=> 'error'
=end
def leap_year? year
  unless year == 0
    if year % 4 == 0
      year % 100 == 0 ? year % 400 == 0 : true
    end
  else
    'error'
  end
end

MINUTES_IN_A_STANDARD_YEAR =      60 * 24 * 365
MINUTES_IN_A_LEAP_YEAR     =      60 * 24 * 366
print "Please enter a valid year: "
loop do
  year = gets.to_i
  if leap_year?(year) == 'error'
    puts 'Numeric characters only please. Remember 0 is not a year.'
    print 'Please try again: '
  else
    minutes = leap_year?(year) ? MINUTES_IN_A_LEAP_YEAR : MINUTES_IN_A_STANDARD_YEAR
    puts "There are #{minutes} minutes in the year #{year}."
    break
  end
end