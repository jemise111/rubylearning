# 1e_dog.rb
# Write class Dog, that has name instance variable and 3 given methods.

class Dog
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
end

if __FILE__ == $PROGRAM_NAME
  puts leo = Dog.new('Leo')
  puts leo.bark
  puts leo.chase_cat
  puts leo.eat
  4.times { puts leo.bark }
  puts leo.chase_cat
  puts leo.eat
  puts leo.chase_cat
end
