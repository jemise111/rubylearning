# 5e_value_of_a_variable.rb

my_string = 'Hello Ruby World'

def my_string
  'Hello World'
end

puts my_string

# Answer why the following program prints the value of the variable.
# My answer:
=begin
Based on the reading I believe in this ambiguous case Ruby first looks
to see if the bareword is a local variable, then a Ruby keyword, then 
a method name. In this case since the local variable my_string is defined,
its value is printed.
=end

