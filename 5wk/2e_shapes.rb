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
    play_sound
    "#{self.class} rotates clockwise 360 degrees"
  end

  def play_sound
    "#{sound_file} plays"
  end
end

class Square < Shape
  def sound_file
    'square_sound_file.aif'
  end
end

class Circle < Shape
  def sound_file
    'circle_sound_file.aif'
  end
end

class Triangle < Shape
  def sound_file
    'triangle_sound_file.aif'
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Square.new(0,0)
  c = Circle.new(0,0)
  t = Triangle.new(0,0)
  puts s.click
  puts c.click
  puts t.click
end
