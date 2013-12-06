# 3e_display_age.rb
# Age is 979000000 seconds. Display age as a floating point (decimal)
# number to 2 decimal places.

SECONDS_IN_A_YEAR = 60 * 60 * 24 * 365
age_in_seconds = 979_000_000
age_in_years = age_in_seconds.to_f / SECONDS_IN_A_YEAR
puts "You are %.2f years old" % age_in_years
puts "You are #### years old".sub('####', age_in_years.to_s)
puts "You are %<age>.2f years old" % {age: age_in_years}


# >> You are 31.04 years old
# >> You are 31.04388635210553 years old
# >> You are 31.04 years old
