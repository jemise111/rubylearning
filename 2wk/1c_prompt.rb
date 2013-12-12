# 1c_prompt.rb
# Write a method that takes a string, displays string as a prompt
# and returns user's response.

=begin
    doctest: return user's response as a string
    >> prompt('?')
    # if user types 'hello' (not sure if this is appropriate test)
    => 'hello'
=end
def prompt question
  puts question
  gets.chomp
end
