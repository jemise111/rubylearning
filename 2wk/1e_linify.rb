# 1e_linify.rb
# Write a program that processes a string a line at a time

=begin
doctest: process string line by line using line numbers
>> linify ("a\nb\nc")
=> "Line 1: a\nLine 2: b\nLine 3: c"
=end
def linify string
  string.each_line.with_index(1).map do |line, i|
    "Line #{i}: #{line}"
  end.join
end

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
puts linify(s)
