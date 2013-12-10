# leap_year.rb
# Write a method leap_year? that checks if a given year is a leap year. Then calculate number of
# minutes in a leap year and a non leap year.

=begin
doctest: return true if a year is a leap year
>> [400, 1896, 2000].map { |y| leap_year?(y) }.all?
=> true
doctest: return false if a year is not a leap year
>> [300, 1900, 2001].map { |y| leap_year?(y) }.all?
=> false
=end
def leap_year? year
  if year % 4 == 0
    year % 100 == 0 ? year % 400 == 0 : true
  else
    false
  end
end

MINUTES_IN_A_STANDARD_YEAR =      60 * 24 * 365
MINUTES_IN_A_LEAP_YEAR     =      60 * 24 * 366
print "Please enter a valid year: "
while true
  year = gets.chomp.to_i
  if year > 0
    puts "There are #{leap_year?(year) ? MINUTES_IN_A_LEAP_YEAR : MINUTES_IN_A_STANDARD_YEAR} minutes in the year #{year}."
    break
  else
    print "A valid year is a positive number. Please try again: "
  end
end