# 2e_rectangle.rb
# Write a rectangle class with methods for area, perimeter calculation.
#
#    doctest: return area of rectangle rounded to 2 decimal places
#    >> r = Rectangle.new(4.55, 1.55)
#    >> r.area
#    => 7.0525
#    doctest: return perimter of rectangle rounded to 2 decimal places
#    >> r = Rectangle.new(3.25, 4.85)
#    >> r.perimeter
#    => 16.2
class Rectangle
  attr_reader :area, :perimeter

  def initialize(length, width)
    @area = (length * width)
    @perimeter = 2 * (length + width)
  end
end

if __FILE__ == $PROGRAM_NAME
  r = Rectangle.new(23.45, 34.67)
  puts "Area is = #{r.area.round(2)}"
  puts "Perimeter is = #{r.perimeter.round(2)}"
end
