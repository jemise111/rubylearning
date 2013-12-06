# c1_year_months.rb
# Challenge: convert age in seconds to age in years and months

# doctest: return year and month as elements of an array
# >> years_months 24 * 60 * 60 * 31
# => [0, 1]
def years_months seconds
  secs_in_a_day = 60 * 60 * 24
  years = seconds / secs_in_a_day / 365
  days = seconds / secs_in_a_day % 365
  months = choose_months(days)
  [years, months]
end

def choose_months days
  #assuming non leap year
  case days.next  # since indexed at 0
  when 1..31
    0
  when 32..59
    1
  when 60..90
    2
  when 91..120
    3
  when 121..151
    4
  when 152..181
    5
  when 182..212
    6
  when 213..243
    7
  when 244..273
    8
  when 274..304
    9
  when 305..334
    10
  when 335..365
    11
  end
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

