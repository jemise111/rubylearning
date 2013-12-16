# key_value_split.rb
# Given string 'key=value' create strings key and value

s = 'key=value'
s1, s2 = s.split('=')
puts s1, s2
