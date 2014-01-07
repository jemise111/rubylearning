# 1c_dog_teach_trick.rb
# Write method teach_trick that allows user to teach a trick to an
# instance of dog.

class Dog
  attr_reader :name
  def initialize(name)
    @name = name
    reset_hunger
  end

  def bark
    increment_hunger
    'RUFF RUFF!'
  end

  def chase_cat
    if hungry?
      <<-EOS.despace
      #{@name} sees a cat but doesn't have the energy to chase it.
        He could use some food.
      EOS
    else
      increment_hunger
      "#{@name} sees a cat and chases it! Good thing he's a friendly dog."
    end
  end

  def eat
    answer = hungry? ?
      "#{@name} chomps away. Boy was he hungry." :
      "#{@name} snacks a bit. He leaves some food left over."
    reset_hunger && answer
  end

  def teach_trick(method_name, *args, &blk)
    define_singleton_method(method_name, blk) do
      yield(*args) if block_given?
    end
  end

  private

  def hungry?
    @hunger_level > 3
  end

  def reset_hunger
    @hunger_level = 0
  end

  def increment_hunger
    @hunger_level += 1
  end

  def method_missing(method, *args, &block)
    $stderr.puts "#{@name} doesn't know how to #{method}"
  end

end

class String
  def despace
    split("\n").map {|e| e.strip }.join(' ')
  end
end

if __FILE__ == $PROGRAM_NAME
  leo = Dog.new('Leo')
  leo.teach_trick(:say_name) do |dog, color='brown'|
    "My name is #{dog.name} and his color is #{color}"
  end

  pluto = Dog.new('Pluto')
  pluto.teach_trick(:count) do |min = 0, last = 3|
  def stagger(min, last)
    min.upto(last) do |n|
      puts n
      sleep 0.5
    end
  end
  print "Let me start: "
  stagger(min, last)
  puts "Yay!"
  end
  pluto.count
  puts leo.say_name(leo, 'purple')
  fido = Dog.new('Fido')
  fido.count(5)
  puts fido.sit
  3.times do
    puts fido.bark
    puts fido.chase_cat
  end
end

