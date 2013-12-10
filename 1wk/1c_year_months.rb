# c1_year_months.rb
# Challenge: convert age in seconds to age in years and months

#    doctest: return year and month as elements of an array
#    >> years_months 24 * 60 * 60 * 32
#    => [0, 1]
def years_months seconds
  secs_in_a_day = 60 * 60 * 24
  years = seconds / secs_in_a_day / 365
  days = seconds / secs_in_a_day % 365
  months = choose_months(days)
  [years, months]
end

#    doctest: choose_months
#    >> choose_months 15
#    => 0
#    >> choose_months 45
#    => 1
#    >> choose_months 75
#    => 2
#    >> choose_months 300
#    => 9
#    >> choose_months 365
#    => 11
#    >> choose_months(366).nil?
#    => true
# Supply the number of days, and you will get the number of months that days
# amount to or for less than 1 day or more than 1 year, you will get nil
def choose_months days
  {
     (1..31)    =>  0,
     (32..59)   =>  1,
     (60..90)   =>  2,
     (91..120)  =>  3,
     (121..151) =>  4,
     (152..181) =>  5,
     (182..212) =>  6,
     (213..243) =>  7,
     (244..273) =>  8,
     (274..304) =>  9,
    (305..334)  => 10,
    (335..365)  => 11,
  }.select {|d, m| d.include?(days) }.values[0]
end

begin
  result = [ 979000000, 2158493738,
    246144023, 1270166272,
    1025600095,
  ].map do |seconds|
    format('If you are %d seconds old, then are %d years and %d months',
           seconds, *years_months(seconds) )
  end
  puts result
end if __FILE__ == $PROGRAM_NAME

