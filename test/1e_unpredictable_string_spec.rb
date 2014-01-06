require 'minitest/autorun'
require_relative '../5wk/1e_unpredictable_string'

describe UnpredictableString do
  before :all do
    @rand = srand(0)
  end

  it 'must scramble deterministically' do
    up = UnpredictableString.new('This is my test string, scramble me.')
    up.send(:scramble).must_equal('ensl,  itba.mm msitt rhecss  rgiyesT')
  end

  it 'must not produce same scrambled string' do
    sample_1 = UnpredictableString.new('Hello, how are you?').send(:scramble)
    sample_2 = UnpredictableString.new('Hello, how are you?').send(:scramble)
    sample_1.wont_equal(sample_2)
  end

  it "must truly be unpredictable and doesn't need a scramble call" do
    up = 5.times.map {UnpredictableString.new('test statement to scramble') }
    up.uniq.size.must_equal 5
  end
end
