require 'minitest/autorun'
require_relative '../4wk/1c_dog_teach_trick.rb'

describe Dog do
  before :each do
    @dog = Dog.new('Fido')
  end

  it 'must learn a trick for one instance only' do
    @dog.teach_trick(:dance) { "The dog is dancing!" }
    @dog.must_respond_to(:dance)
    Dog.new('Leo').wont_respond_to(:dance)
    # must_output takes argument for which pipe, nil to check stderr
    -> {Dog.new('Leo').dance}.must_output(nil, /doesn't know how to/)
  end

  it 'must learn to say name' do
    @dog.teach_trick(:say_name, @dog) {|dog| "My name is #{dog.name}" }
    @dog.must_respond_to(:say_name)
    @dog.say_name(@dog).must_match(/Fido/)
  end
end
