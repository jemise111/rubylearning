require 'minitest/autorun'
require_relative '../4wk/playfair'

describe Playfair do
  before :each do
    @pf = Playfair.new("play',fajr exxample e*%")
  end

  it 'must prepare key for the table' do
    @pf.table_ready_key.join.must_equal('PLAYFIREXM')
  end

  it 'must prepare a table ready alphabet' do
    @pf.table_alphabet.join.must_equal('PLAYFIREXMBCDGHKNOQSTUVWZ')
  end

  it 'must create a table' do
    a = [%w[P L A Y F],
         %w[I R E X M], 
         %w[B C D G H], 
         %w[K N O Q S], 
         %w[T U V W Z]]
    @pf.table.must_equal(a)
  end
end
