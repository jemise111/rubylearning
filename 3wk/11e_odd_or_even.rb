# 11e_odd_or_even.rb
# Given array of numbers, print each number and say whether it is
# odd or even.

=begin
    doctest: return 'odd' or 'even' for given integer
    >> odd_or_even(4)
    => 'even'
    >> odd_or_even(-3)
    => 'odd'
=end
def odd_or_even integer
  integer.even? ? 'even' : 'odd'
end

if __FILE__ == $PROGRAM_NAME
  collection = [12, 23, 456, 123, 4579]
  collection.each { |n| puts "#{n} is #{odd_or_even(n)}" }
end
