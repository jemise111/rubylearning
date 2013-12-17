# 8e_fizzbuzz.rb
# Print 1-100 substitution 'Fizz' for multiples of 3 and 'Buzz' for
# multiples of 5

=begin
    doctest: return 'Fizz' for multiples of 3, 'Buzz' for multiples of 5,
    'FizzBuzz' when both cases true
    >> fizzbuzz(3)
    => 'Fizz'
    >> fizzbuzz(5)
    => 'Buzz'
    >> fizzbuzz(15)
    => 'FizzBuzz'
=end
def fizzbuzz integer
  result = ''
  result << 'Fizz' if integer % 3 == 0
  result << 'Buzz' if integer % 5 == 0 
  result
end

1.upto(100) do |n|
  puts "#{n % 3 == 0 || n % 5 == 0 ? fizzbuzz(n) : n}"
end
