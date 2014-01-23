require 'minitest/autorun'
require_relative '../7wk/2e_DTRConvertor_fix'

describe 'DTRConvertor_fix' do
  it 'must accurately convert from dollars' do
    m = DTRConvertor.new
    m.convert(100.0).must_equal(3800.0)
  end
end
