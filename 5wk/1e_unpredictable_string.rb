# 1e_unpredictable_string.rb
# Write sub-class of string with scramble method to randomly rearrange a string

class UnpredictableString
  def initialize(arg)
    @up = String.new(arg)
  end

  def to_s
    scramble
  end

  private

  def scramble(rand = Random.rand)
    @up.split(//).shuffle.join
  end

end

if __FILE__ == $PROGRAM_NAME
  test = UnpredictableString.new('It was a dark and stormy night.')
  5.times do
    puts test
  end
end
