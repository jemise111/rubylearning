# lesson7exercise1a.rb
# Create an object of class Klass, marshal it and restore it
require_relative 'lesson7exercise1'

if __FILE__ == $PROGRAM_NAME
  cat = Klass.new('meow')
  puts cat.say_hello 
  File.open('7wk/cat_storage', 'w+') do |f|
    Marshal.dump(cat, f)
  end
  cat = Marshal.load(File.open('7wk/cat_storage'))
  puts cat.say_hello
end
