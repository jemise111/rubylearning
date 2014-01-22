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

class UndefinedLevelError < RuntimeError
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

def add_to_log message
  user_level = ARGV[1]
  choose_level = {
    fatal: Logger::FATAL,
    error: Logger::ERROR,
    warn: Logger::WARN,
    info: Logger::INFO,
    debug: Logger::DEBUG
  }
  if user_level.nil?
    $LOG.info(message) # default level
  elsif choose_level.keys.include?(user_level.to_sym)
    $LOG.add(choose_level[user_level.to_sym], message)
  else
    raise UndefinedLevelError
  end
end

def log?
  ARGV[0] == '-l' || ARGV[0] == '--logger'
end

if __FILE__ == $PROGRAM_NAME
  $LOG = Logger.new('logs/3e_analayzer_logger.log') if log?
  file_name = ['3wk/text.txt', '6wk/text2.txt']
  begin
    file_name.each do |f|
      analysis = "File: #{f}\n#{analyze(IO.read(f)).display}"
      add_to_log(analysis) if log?
      puts analysis
      puts
    end
  rescue UndefinedLevelError
    puts 'Please use an accurate logger level'
  end
end
