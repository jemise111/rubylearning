# 7e_repeat_call.rb
# Write a method to run some Ruby code repeatedly at a certain interval

def repeat_call(repetitions, interval)
  repetitions.times do
    yield
    sleep(interval)
  end
end

if __FILE__ == $PROGRAM_NAME
#  repeat_call(12, 5) { system 'ls' }
  repeat_call(12, 5)
end
