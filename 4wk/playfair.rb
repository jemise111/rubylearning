# playfair.rb

class Playfair
  attr_reader :key
  def initialize(key = '')
    @key = key
  end

  def table_ready_key
    result = key.upcase.squeeze.gsub(/[^A-Z]/, '')
    result.gsub('J','I').split(//).uniq
  end

  def table_alphabet
    result = table_ready_key
    for i in 'A'..'Z'
      result.push(i) unless i == 'J' || result.include?(i)
    end
    result
  end

  def table
    table_contents = table_alphabet
    5.times.map do
      5.times.map { table_contents.shift }
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  pf = Playfair.new('i love jruby')
  0.upto(4) do |i|
    puts pf.table[i].join(' ')
  end
end
