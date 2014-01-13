# 4e_analyzer_exception.rb
# Modify analyzer to add exception feature
require 'logger'

class Symbol
  def titleize
    title = self.to_s.split('_')
    title.each { |word| word.capitalize! }.join(' ')
  end
end

def analyze file_contents
  file_stats = {}
  file_stats[:lines] = file_contents.lines.size
  # new line ("\n") counted as one character in character count
  file_stats[:characters] = file_contents.length
  file_stats[:characters_ex_spaces] = file_contents.split.join.length
  file_stats[:words] = file_contents.split.size
  file_stats[:sentences] = file_contents.split(/[!.?]/).size
  file_stats[:paragraphs] = file_contents.split("\n\n").size
  file_stats[:words_per_sentence] =
    (file_stats[:words].to_f / file_stats[:sentences]).round(2)
  file_stats[:sentences_per_paragraph] =
    (file_stats[:sentences].to_f / file_stats[:paragraphs]).round(2)
  file_stats
end

def get_file_contents_with_rescue
  begin
    print 'Enter file to analyze: '
    file_name = gets.chomp
    IO.read(file_name)
  rescue StandardError
    puts 'Please enter a valid file name: '
    retry
  end
end

if __FILE__ == $PROGRAM_NAME
  analyze(get_file_contents_with_rescue).each do |k, v|
    puts "#{k.titleize}: #{v}"
  end
end
