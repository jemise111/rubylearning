# 4e_range.rb
# Given the following code, which output will never be displayed?
# 1929, 1930, 1945, 1950, 1951, 1952

a = (1930...1951).to_a
puts a[rand(a.size)]

# My explanation:
# 1929, 1951, and 1952 will never be displayed.
# 1930...1951 includes integers from 1930 to 1950 since it is not
# an inclusive range. Therefore 1929, 1951, and 1952 are not in the range
# or array from which a[rand[21] is pulling integers.
