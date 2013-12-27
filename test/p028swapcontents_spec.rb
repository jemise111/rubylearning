require 'minitest/autorun'
require_relative '../4wk/p028swapcontents'

describe 'file swap' do
  before :each do
    File.new('file_a.txt', 'w') { |f| f.puts('test a') }
    File.new('file_b.txt', 'w') { |f| f.puts('test b') }
  end
  
  it 'must copy contents from one file to another' do
    copy_contents('file_a.txt', 'file_b.txt')
    File.open('file_b.txt').readlines.join.must_match(/a/)
  end
end
