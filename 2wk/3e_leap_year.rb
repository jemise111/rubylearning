# leap_year.rb
# Write a method leap_year? that checks if a given year is a leap year. Then calculate number of
# minutes in a leap year and a non leap year.

=begin
doctest: setup
>> leap_year_with_error_raise = ->(year){ begin ; leap_year?(year) ; rescue => e ; e.class ; end }
doctest: return true if a year is a leap year
>> [-400, -1896, -2000, 400, 1896, 2000].map {|year| leap_year?(year) }.all?
=> true
doctest: return false if a year is not a leap year
>> [-300, -1900, -2001, 300, 1900, 2001].map { |y| leap_year?(y) }.all?
=> false
doctest: raise an error if year is 0
>> leap_year_with_error_raise[0]
=> RuntimeError
=end
def leap_year? year
  year.zero? && fail("Invalid Year 0")
  year % 400 == 0 || year % 4 == 0 && year % 100 != 0
end

if __FILE__ == $PROGRAM_NAME
  MINUTES_IN_A_STANDARD_YEAR = 60 * 24 * 365
  MINUTES_IN_A_LEAP_YEAR     = 60 * 24 * 366
  print "Please enter a valid year: "
  year = gets.to_i until year && !year.zero? && year.is_a?(Numeric) && puts("Try again")
  minutes = leap_year?(year) ? MINUTES_IN_A_LEAP_YEAR : MINUTES_IN_A_STANDARD_YEAR
  puts "There are #{minutes} minutes in the year #{year}."
end
