require 'minitest/autorun'
require_relative '../5wk/2e_shapes'

describe Shape do
  before :each do
    @s = Square.new(2,4)
    @c = Circle.new(2,4)
    @t = Triangle.new(2,4)
  end

  it 'must recognize start positions' do
    @s.x_start.must_equal(2)
    @t.y_start.must_equal(4)
  end 

  it 'must rotate when clicked' do
    @c.click.must_match(/rotates/)
  end

  it 'must play shape-specific sound' do
    @s.play_sound.must_match(/square_sound_file.aif/)
  end
end
