# 10e_sum_of_elements.rb
# Given collection of integers as an array, calculate sum of elements.

=begin
    doctest: calculate sum of elements of an array
    >> a = [1, 2, 3]
    >> sum_elements(a)
    => 6
    >> a = [-4, 2.5, 100]
    >> sum_elements(a)
    => 98.5
=end
def sum_elements array_of_numbers
  result = 0
  array_of_numbers.each { |n| result += n }
  result
end

if __FILE__ == $PROGRAM_NAME
  collection = [1, 2, 3, 4, 5]
  puts sum_elements(collection)
end
