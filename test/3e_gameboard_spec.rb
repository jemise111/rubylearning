require 'minitest/autorun'
require_relative '../5wk/3e_gameboard'

describe GameBoard do
  before :each do
    @gb = GameBoard.new
    @gb.set_locations_cells [0, 1, 2]
  end

  it 'must set locations cells' do
    @gb.instance_variable_get(:@locations).join.must_equal('012')
  end

  it 'must display appropriate message' do
    [
      [3, "Miss\n"],
      [2, "Hit\n"],
      [1, "Hit\n"],
      [0, "End\n"],
    ].each do |g, r|
      -> { @gb.check_yourself(g) }.must_output r
    end
  end

  it 'must return kill string only if all targets are hit' do
    @gb.check_yourself('4')
    @gb.check_yourself('0').wont_equal('kill')
    @gb.check_yourself('1')
    @gb.check_yourself('2').must_equal('kill')
  end
end
