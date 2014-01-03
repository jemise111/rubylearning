# 2e_shapes.rb
# There will be shapes on a GUI, a square, a circle and a triangle. When the user
# clicks on a shape, the shape will rotate clockwise 360 degrees (ie. all the
# way around) and play an AIF sound file specific to that particular shape.

class Shape
  attr_reader :x_start, :y_start
  def initialize(x_start, y_start)
    @x_start = x_start
    @y_start = y_start
  end

  def click
    puts play_sound
    puts "#{self.class} rotates clockwise 360 degrees"
  end

  def play_sound
    "#{sound_file} plays"
  end
  private
  def sound_file
    self.class.to_s.downcase + '.aif'
  end
end

class Square < Shape
end

class Circle < Shape
end

class Triangle < Shape
end

if __FILE__ == $PROGRAM_NAME
  s = Square.new(0,0)
  c = Circle.new(0,0)
  t = Triangle.new(0,0)
  s.click
  c.click
  t.click
end
