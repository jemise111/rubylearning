# 1e_dog.rb
# Write class Dog, that has name instance variable and 3 given methods.

class Dog
  def initialize(name)
    @name = name
    @hunger_level = 0
  end

  def bark
    @hunger_level += 1
    'RUFF RUFF!'
  end

  def chase_cat
    if !hungry?
      @hunger_level += 1
      "#{@name} sees a cat and chases it! Good thing he's a friendly dog."
    else
      "#{@name} sees a cat but doesn't have the energy to chase it. He could use some food."
    end
  end

  def eat
    @hunger_level = 0
    if hungry?
      "#{@name} chomps away. Boy was he hungry."
    else
      "#{@name} snacks a bit. He leaves some food left over."
    end
  end

  private
    def hungry?
      @hunger_level > 3
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
