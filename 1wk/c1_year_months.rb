# c1_year_months.rb
# Challenge: convert age in seconds to age in years and months

def age_in_yrs_mos age_in_seconds
  secs_in_a_day = 60 * 60 * 24
  yrs = age_in_seconds / secs_in_a_day / 365
  days = age_in_seconds / secs_in_a_day % 365
  month = choose_mo_from_days(days)
  puts "I'm #{yrs} years and #{month} month(s) old."
end

def choose_mo_from_days days
  #assuming non leap year
  case days + 1   # since indexed at 0
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

age_in_yrs_mos(979000000)
age_in_yrs_mos(2158493738)
age_in_yrs_mos(246144023)
age_in_yrs_mos(1270166272)
age_in_yrs_mos(1025600095)



