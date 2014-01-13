require 'minitest/autorun'
require_relative '../6wk/5e_game'

describe 'game' do
  before :each do
    save_game('6wk/test_game.sav')
    sleep(2)
  end

  it 'must raise RunTimeError when cheating detected' do
    open('6wk/test_game.sav', 'r+b') { |f| f.write('9') }
    -> { load_game('6wk/test_game.sav') }.must_raise RuntimeError
  end

  it 'must return score when no cheating detected' do
    load_game('6wk/test_game.sav').must_equal(1000)
  end
end
