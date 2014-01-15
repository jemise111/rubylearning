# 1e_class_person.rb
# Write a class called Person that has balance as an instance variable and
# make it readable via an accessor

class Person
  attr_reader :balance
  def initialize(balance)
    @balance = balance
  end
end

if __FILE__ == $PROGRAM_NAME
  jon = Person.new('tightrope-worthy')
  puts "Jon has #{jon.balance} balance."
end
