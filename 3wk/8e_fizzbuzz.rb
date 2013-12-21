# 8e_fizzbuzz.rb
# Print 1-100 substitution 'Fizz' for multiples of 3 and 'Buzz' for
# multiples of 5

=begin
    doctest: return 'Fizz' for multiples of 3, 'Buzz' for 5, 'Dazz'
    for 7, 'Kezz' for 11, integer otherwise
    >> fizzbuzz(3)
    => 'Fizz'
    >> fizzbuzz(5)
    => 'Buzz'
    >> fizzbuzz(15)
    => 'FizzBuzz'
    >> fizzbuzz(21)
    => 'FizzDazz'
    >> fizzbuzz(77)
    => 'DazzKezz'
    >> fizzbuzz(2)
    => 2
=end
def fizzbuzz integer
  result = ''
  fizzbuzz = { 3 => 'Fizz', 5 => 'Buzz', 7 => 'Dazz', 11 => 'Kezz' }
  fizzbuzz.each { |k, v| result << v if integer % k == 0 }
  result.length == 0 ? integer : result
end

if __FILE__ == $PROGRAM_NAME
  1.upto(100) { |n| puts fizzbuzz(n) }
end
