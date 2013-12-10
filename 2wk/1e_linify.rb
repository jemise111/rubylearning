# 1e_linify.rb
# Write a program that processes a string a line at a time

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
num_lines = s.split("\n").size
num_lines.times { |l| puts "Line #{l.next}: #{s.split("\n")[l]}"}