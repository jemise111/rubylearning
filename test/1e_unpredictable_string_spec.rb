require 'minitest/autorun'
require_relative '../5wk/1e_unpredictable_string'

describe UnpredictableString do
  before :each do
    @rand = Random.new(Random.new(0).seed)
  end

  it 'must scramble deterministically' do
    test = UnpredictableString.new('This is my test string, scramble me.')
    test.scramble(@rand).must_equal('ensl,  itba.mm msitt rhecss  rgiyesT')
  end

  it 'must not produce same scrambled string' do
    test1 = UnpredictableString.new('Hello, how are you?').scramble
    test2 = UnpredictableString.new('Hello, how are you?').scramble 
    test1.wont_equal(test2)
  end
end
