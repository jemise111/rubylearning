require 'minitest/autorun'
require_relative '../4wk/2e_rectangle'

describe Rectangle do
  before :each do
    @rectangle = Rectangle.new(2.25, 1.75)
  end
  
  it 'must give an area of x' do
    @rectangle.area.must_equal(3.9375)
  end

  it 'must give perimeter of x' do
    @rectangle.perimeter.must_equal(8)
  end

  it 'must not expose length' do
    @rectangle.instance_variable_get(:@length).must_equal nil
  end
  it 'must not expose width' do
    @rectangle.instance_variable_get(:@width).must_equal nil
  end
end
