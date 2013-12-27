require 'minitest/autorun'
require_relative '../4wk/1e_dog'

describe Dog do
  before :each do
    @dog = Dog.new('Fido')
  end

  it 'must have a name' do
    @dog.instance_variable_get(:@name).must_equal 'Fido'
  end

  it 'must bark' do
    @dog.bark.must_match(/RUFF/)
  end

  it 'must eat' do
    @dog.eat.must_match(/snack/)
  end

  it 'must chase a cat' do
    @dog.chase_cat.must_match(/chases/)
  end

  it 'must not chase cat if too hungry' do
    4.times { @dog.bark }
    @dog.chase_cat.must_match(/could use some food/)
  end

  it 'must eat hastily if hungry' do
    6.times { @dog.bark }
    @dog.eat.must_match(/chomps/)
  end
end
