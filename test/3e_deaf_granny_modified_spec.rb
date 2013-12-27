require 'minitest/autorun'
require './4wk/3e_deaf_granny_modified'

describe Granny do
  before :each do
    @granny = Granny.new
  end

  it 'must tell you to speak up' do
    @granny.response('hello').must_match(/HUH/)
  end

  it 'must respond with granny exclamation' do
    @granny.response('HELLO').must_match(/SINCE/)
  end

  it "must ignore you if doesn't receive 3 consecutive BYE's" do
    2.times { @granny.response("BYE") }
    @granny.done?('BYE').must_equal true
  end

  it 'must not respond to silence' do
    @granny.response('').must_be_nil
  end

  it "displays greeting with granny's name" do
    @granny.greeting.must_match(/Lilly/)
  end
end
