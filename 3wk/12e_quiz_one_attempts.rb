# 12e_quiz_one_attempts.rb
# Given array of 1's and 0's tracking students who completed
# quiz 1, Record number of students who did not complete it.

=begin
    doctest: returns number of 0 entries in an array
    >> a = [0, 0, 0, 1]
    >> number_of_zeros(a)
    => 3
=end
def number_of_zeros quiz_array
  result = 0
  quiz_array.each { |n| result += 1 if n == 0 }
  result
end

if __FILE__ == $PROGRAM_NAME
  quiz = [0, 0, 0, 1, 0, 0, 1, 1, 0, 1]
  puts 'The number of participants who did not attempt Quiz 1 is'
  puts "#{number_of_zeros(quiz)} out of #{quiz.size} total participants."
end
