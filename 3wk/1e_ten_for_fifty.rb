# 1e_ten_for_fifty.rb
# Explain why we see the output of this program

def method
  a = 50
  puts a
end

a = 10
method
puts a

=begin
My Explanation:
The program outputs:
50
10

The first expression that produces output in the running code is 'method'.
We run method which assigns 50 to the local variable a. We puts a, which
within the scope of the method 'method' is 50.

On line 6 a was assigned the value 10 within the scope of the running code.
So when we puts a within this scope on line 8 we see 10.
=end
