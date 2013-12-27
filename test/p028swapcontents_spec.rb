require 'minitest/autorun'
require_relative '../4wk/p028swapcontents'

describe 'file_swap' do
  before :each do
    File.open('file_a.txt', 'w') { |f| f.write('this is test a') }
    File.open('file_b.txt', 'w') { |f| f.write('this is test b') }
  end

  after :each do
    File.delete('file_a.txt')
    File.delete('file_b.txt')
  end

  it 'must copy contents from one file to another' do
    copy_contents('file_a.txt', 'file_b.txt')
    File.open('file_b.txt').read.must_match(/a/)
  end

  it 'must swap contents from two files' do
    swap_contents('file_a.txt', 'file_b.txt')
    File.open('file_a.txt').read.must_match(/b/)
    File.open('file_b.txt').read.must_match(/a/)
  end
end
