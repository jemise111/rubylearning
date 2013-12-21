# 8e_fizzbuzz.rb
# Print 1-100 substituting 'Fizz' for multiples of 3, 'Buzz' for
# multiples of 5, 'Dazz' for multples of 7, 'Kezz' for multiples
# of 11.

=begin
    doctest: return 'Fizz' for multiples of 3, 'Buzz' for 5, 'Dazz'
    for 7, 'Kezz' for 11, integer otherwise
    >> fizzbuzz(3)
    => 'Fizz'
    >> fizzbuzz(5)
    => 'Buzz'
    >> fizzbuzz(15)
    => 'FizzBuzz'
    >> fizzbuzz(21, 7 => 'Dazz')
    => 'FizzDazz'
    >> fizzbuzz(77, 7 => 'Dazz', 11 => 'Kezz')
    => 'DazzKezz'
    >> fizzbuzz(2)
    => 2
=end
def fizzbuzz integer, rules = {}
  result = ''
  default_rules = { 3 => 'Fizz', 5 => 'Buzz' }
  fizzbuzz = default_rules.merge rules
  fizzbuzz.each { |k, v| result << v if (integer % k).zero? }
  result.length == 0 ? integer : result
end

if __FILE__ == $PROGRAM_NAME
  -15.upto(15) { |n| puts fizzbuzz(n, {7 => 'Dazz', 11 => 'Kezz' }) }
end
