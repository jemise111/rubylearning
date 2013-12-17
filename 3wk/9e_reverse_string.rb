# 9e_reverse_string.rb
# Reverse the word order of a given string

=begin
    doctest: reverse word order of a string
    >> reverse_word_order('This is a test.')
    => 'test. a is this'
=end
def reverse_word_order string
  word_array = string.split
  word_array.reverse.join(' ')
end

test_string = 'This is a test string. Will it appear in reverse?'
puts reverse_word_order(test_string)
