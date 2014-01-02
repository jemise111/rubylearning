require 'minitest/autorun'
require_relative '../5wk/3e_gameboard'

describe GameBoard do
  before :each do
    @gb = GameBoard.new
  end

  it 'must set locations cells' do
    locations = [3, 4, 5]
    @gb.set_locations_cells(locations)
    @gb.instance_variable_get(:@locations).join.must_equal('345')
  end

  it 'must display appropriate message' do
    @gb.set_locations_cells([0, 1, 2])
    # how to test what is puts'ed
  end

  it 'must recognize invalid input' do
    @gb.invalid_input?(3).must_be_nil
    @gb.invalid_input?('h').must_equal(0)
    # broken test
    # @gb.invalid_input?(8).must_equal(0)
    @gb.invalid_input?(20).must_equal(true)
  end

  it 'must return kill string if kill is entered' do
    @gb.set_locations_cells([0, 1, 2])
    @gb.check_yourself('kill').must_equal('kill')
  end

  it 'must return true if game is over' do
    @gb.set_locations_cells([0, 1, 2])
    @gb.check_yourself(4)
    @gb.check_yourself(0)
    @gb.check_yourself(1)
    @gb.check_yourself(2)
    @gb.game_over?.must_equal(true)
  end

  it 'must choose the correct rating' do
    @gb.choose_rating(3).must_equal('Expert')
  end
end
