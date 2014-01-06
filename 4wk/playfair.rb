# playfair.rb

class Playfair
  attr_reader :key
  def initialize(key = '')
    @key = key
  end

  def table_ready_key
    result = key.upcase.squeeze.gsub(/[^A-Z]/, '')
    result.gsub('J', 'I').split(//).uniq
  end

  def table_alphabet
    result = table_ready_key
    ('A'..'Z').each do |i|
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

  def prepare_for_encoding(message)
    digraph_array = message.upcase.gsub(/J/, 'I').delete(' ').scan(/.{1,2}/)
    result = digraph_array
    (0..digraph_array.size - 1).each do |i|
      if result[i][1].nil? # check for end of array
      else
        if result[i][0] == result[i][1]
          replace_char = result[i - 1].include?('X') ? 'Z' : 'X'
          result[i].insert(1, replace_char)
          result = result.join.scan(/.{1,2}/)
        end
      end
    end
    result[result.size - 1] << 'X' if result[result.size - 1].length.odd?
    result
  end
end

if __FILE__ == $PROGRAM_NAME
  pf = Playfair.new('i love jruby')
  0.upto(4) do |i|
    puts pf.table[i].join(' ')
  end
  puts
  puts pf.prepare_for_encoding('Hide the gold in the tree stump').join(' ')
end
