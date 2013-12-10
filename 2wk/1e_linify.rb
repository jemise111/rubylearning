# 1e_linify.rb
# Write a program that processes a string a line at a time

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
number_of_lines = s.split("\n").size
number_of_lines.times { |i| puts "Line #{i.next}: #{s.split("\n")[i]}"}