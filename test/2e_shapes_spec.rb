require 'minitest/autorun'
require_relative '../5wk/2e_shapes'

describe Shape do
  before :each do
    @s = Square.new
    @c = Circle.new
    @t = Triangle.new
  end

  it 'must output when clicked' do
    expected = -> {@s.click}
    expected.must_output
  end

  it 'must play shape-specific sound' do
    @s.play_sound.must_match(/.aif/)
  end

  it 'must rotate' do
     @t.rotate.must_include 'rotate'
  end

  it 'must raise NotImplemented if rotate is not inplmented' do
    expected = -> {@t.play_sound}
    expected.must_raise NotImplemented
  end
end
