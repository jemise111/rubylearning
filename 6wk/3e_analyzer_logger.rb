# 3e_analyzer_logger.rb
# Modify analyzer to add logger feature
require 'logger'

class Symbol
  def titleize
    title = self.to_s.split('_')
    title.each { |word| word.capitalize! }.join(' ')
  end
end

class Hash
  def display
    result = '' and self.each do |k, v|
      result << "#{k.titleize}: #{v}\n"
    end
    result
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

if __FILE__ == $PROGRAM_NAME
  $LOG = Logger.new('logs/3e_analayzer_logger.log')
  file_name = ['3wk/text.txt', '6wk/text2.txt']
  file_name.each do |f|
    analysis = "File: #{f}\n#{analyze(IO.read(f)).display}"
    $LOG.info(analysis)
    puts analysis
    puts
  end
end
