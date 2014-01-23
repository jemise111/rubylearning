# 3e_month_days.rb
# Write a method month_days, that determines the number of days in a month.
require 'date'

def month_days(month, year = 1999)     # non-leap year as default
  Date.new(year, month, -1).day
end

if __FILE__ == $PROGRAM_NAME
  [1, 2, 11].each { |m| puts month_days(m) }
  [[2, 1990], [2, 1996]].each { |m, y| puts month_days(m, y) }
end
