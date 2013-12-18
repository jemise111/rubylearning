# 9e_reverse_string.rb
# Reverse the word order of a given string

=begin
    doctest: reverse word order of a string
    >> s = "This is test line one."
    >> reverse_word_order(s)
    => "one. line test is This"
    doctest: Lines are handled this way
    >> s = "This is test line one.\nThis is test line two."
    >> reverse_word_order(s)
    => "two. line test is This one. line test is This"
=end
def reverse_word_order string
  string.split.reverse.join(' ')
end

if __FILE__ == $PROGRAM_NAME
  test_string = "This is a test string.\nThis line should be returned first."
  puts reverse_word_order(test_string)
end

