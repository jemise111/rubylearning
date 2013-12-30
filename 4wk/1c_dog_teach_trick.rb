# 1c_dog_teach_trick.rb
# Write method teach_trick that allows user to teach a trick to an instance of dog.

class Dog
  def initialize(name)
    @name = name
    reset_hunger
  end

  def teach_trick(method_name)
    define_singleton_method(method_name) do
      yield
    end
  end

  def bark
    increment_hunger
    'RUFF RUFF!'
  end

  def chase_cat
    if hungry?
      "#{@name} sees a cat but doesn't have the energy to chase it. He could use some food."
    else
      increment_hunger
      "#{@name} sees a cat and chases it! Good thing he's a friendly dog."
    end
  end

  def eat
    answer = if hungry?
               "#{@name} chomps away. Boy was he hungry."
             else
               "#{@name} snacks a bit. He leaves some food left over."
             end
    reset_hunger && answer
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
    @name.send(method, *args, &block)
  rescue NoMethodError
    "#{@name} doesn't know how to #{method}"
  end
end

if __FILE__ == $PROGRAM_NAME
  leo = Dog.new('leo')
  leo.teach_trick(:say_name) { "My name is #{@name.inspect}" }
  puts leo.say_name
  fido = Dog.new('fido')
  puts fido.sit
end
