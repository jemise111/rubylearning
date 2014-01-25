# 2e_DTRConvertor_fix.rb
# Fix the bug in DTRConvertor without changing the source file itself

require_relative '2e_DTRConvertor'

class DTRConvertor
  def convert(dollar_amount)
    dollar_amount * 38.0
  end
end

if __FILE__ == $PROGRAM_NAME
  m = DTRConvertor.new
  puts m.convert(100.0)
end

