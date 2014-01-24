# 7e_analyzer.rb
# Write a text analyzer according to the guidelines

=begin
    doctest: returns title from symbol delimited by underscores
    >> titleize_symbol(:this_is_a_title)
    => 'This Is A Title'
=end
def titleize_symbol symbol
  title = symbol.to_s.split('_')
  title.each { |word| word.capitalize! }.join(' ')
end

def analyze file
  file_stats = {}
  text = ''
  File.open(file).each_line.with_index(1) do |line, index|
    text << line
    file_stats[:lines] = index
  end
  text.chomp!               # gets rid of artificial trailing "\n"
  # new line ("\n") counted as one character in character count
  file_stats[:characters] = text.length
  file_stats[:characters_ex_spaces] = text.split.join.length
  file_stats[:words] = text.split.size
  file_stats[:sentences] = text.split(/[!.?]/).size
  file_stats[:paragraphs] = text.split("\n\n").size
  file_stats[:words_per_sentence] = 
    (file_stats[:words].to_f / file_stats[:sentences]).round(2)
  file_stats[:sentences_per_paragraph] = 
    (file_stats[:sentences].to_f / file_stats[:paragraphs]).round(2)
  file_stats
end

if __FILE__ == $PROGRAM_NAME
  file = 'text.txt'
  analyze(file).each do |k, v|
    puts "#{titleize_symbol(k)}: #{v}"
  end
end
