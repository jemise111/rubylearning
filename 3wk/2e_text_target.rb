# 2e_text_target.rb
# Write a program to open the file 2e_text.txt and insert word
# 'inserted' before the word 'word'

=begin
    doctest: if string contains 'word' insert 'insert' and return string
    >> line = 'text text text'
    >> conditional_insert(line)
    => 'text text text'
    >> line = 'text word text'
    >> conditional_insert(line)
    =>'text insert word text'
=end
def conditional_insert line
  if !line.include?('insert')
    line.gsub('word', 'insert word')
  else
    line
  end
end

=begin
    doctest: open a file and return manipulated lines as string
    >> file = 'text.txt'
    >> file_lines_to_array(file)
    => "text text text text text
        text text text text text
        text text insert word text text
        text text text text text
        text text text text text
        "
=end
def file_lines_to_array file
  File.open(file, 'r').each_line.map do |line|
    conditional_insert(line)
  end.join
end

if __FILE__ == $PROGRAM_NAME
  file = ARGV[0]
  File.open(file, 'r+') { |f| f.write(file_lines_to_array(file)) }
end
