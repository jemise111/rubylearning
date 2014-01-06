# 2e_shapes.rb
# There will be shapes on a GUI, a square, a circle and a triangle. When the
# user clicks on a shape, the shape will rotate clockwise 360 degrees (ie. all
# the way around) and play an AIF sound file specific to that particular shape.

class NotImplemented < Exception
end

class Shape
  def initialize
    @name = self.class.to_s.downcase
  end

  def click
    puts play_sound
    puts rotate
  end

  def rotate
    "#{@name} rotates clockwise"
  end

  def play_sound
    fail NotImplemented, 'Not Implemented'
  end

  private

  def sound_file
    @name + '.aif'
  end
end

class Square < Shape
  def play_sound(extension = '.aif')
    @name + extension
  end
end

class Circle < Shape
  def rotate
    "It is a circle, you can't tell if is rotating anyway"
  end

  def play_sound(extension = '.aif')
    @name + extension
  end
end

class Triangle < Shape
  #def play_sound(extension = '.aif')
    #@name + extension
  #end
end

if __FILE__ == $PROGRAM_NAME
  begin
    [Square.new, Circle.new, Triangle.new].each do |shape|
      shape.click
    end
  rescue NotImplemented
    puts "You forgot to implement play_sound"
  end
  puts '-' * 30
  puts 'Program exits normally'
end
