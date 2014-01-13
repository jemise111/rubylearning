require 'minitest/autorun'
require_relative '../6wk/1e_class_person'

describe Person do
  before :each do
    @p = Person.new('this is balance')
  end

  it 'must respond to balance getter method' do
    @p.must_respond_to('balance')
  end
end
