# 2e_diff_in_outputs_b.rb
# Understand difference in outputs of the two programs

def mtdarry
  10.times do |num|
    puts num
  end
end

puts mtdarry

=begin
My explanation: In case a we call the method mtdarry which will puts
num where num starts at 0 and increments by one 10 times.

In case b we puts mtdarry which runs the method mtdarry(therefore we get the
output from case a) and we puts its result. Integer#times retuns self which
in this case is 10.
=end