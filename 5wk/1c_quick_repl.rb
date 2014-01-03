# 1c_quick_repl.rb
# Build a simple Ruby REPL

def evaluate(expression)
  eval(expression).inspect
end

def repl
  expression = ''
  line_no = 1
  begin
    until expression == 'exit'
      print "#{RUBY_VERSION}; %03i >> " % line_no
      expression = gets.chomp
      line_no += 1
      puts "=> #{evaluate(expression)}"
    end
  rescue Exception => e
    puts e.inspect unless expression == 'exit'
    retry
  end
end

if __FILE__ == $PROGRAM_NAME
  puts
  puts '------------------------------'
  puts ' One-Liner: A Simple Ruby REPL'
  puts '------------------------------'
  puts "    (use 'exit' to exit)"
  puts
  repl
end
