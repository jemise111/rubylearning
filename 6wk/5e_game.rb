# 5e_game.rb
# Add a method load_game that checks for cheating my comparing the file's
# modification time with the internally recorded time.

def save_game(file)
  score = 1000
  open(file, 'w') do |f|
    f.puts(score)
    f.puts(Time.new.to_i)
  end
end

def load_game(file)
  f = File.open(file,'r')
  score, time = f.each_line.map { |line| line.to_i }
  raise 'I suspect you of cheating.' if time != File.mtime(f).to_i
  "Your saved score is #{score}"
end

if __FILE__ == $PROGRAM_NAME
  save_game('6wk/game.sav')
  sleep(2)
  puts load_game('6wk/game.sav') # => "Your saved score is 1000."

  # Now let's cheat by increasing our score to 9000
  open('6wk/game.sav', 'r+b') { |f| f.write('9') }
  puts load_game('6wk/game.sav') # RuntimeError: I suspect you of cheating.
end
