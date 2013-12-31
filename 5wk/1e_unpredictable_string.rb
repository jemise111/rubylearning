# 1e_unpredictable_string.rb
# Write sub-class of string with scramble method to randomly rearrange a string

class UnpredictableString < String
  def scramble(rand = Random.rand)
    self.split(//).shuffle(random: rand).join
  end
end

if __FILE__ == $PROGRAM_NAME
  test = UnpredictableString.new('It was a dark and stormy night.')
  puts test.scramble
end
