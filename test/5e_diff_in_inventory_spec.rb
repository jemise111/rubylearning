require 'minitest/autorun'
require_relative '../4wk/5e_diff_in_inventory'

describe 'file_swap' do
  before :each do
    File.open('old-inventory.txt', 'w') { |f| f.write("testfile1\n") }
    File.open('new-inventory.txt', 'w') { |f| f.write("testfile1\ntestfile2\n") }
  end

  after :each do
    File.delete('old-inventory.txt')
    File.delete('new-inventory.txt')
  end

  it 'must only contain unique content in second file' do
    diff = diff_contents('old-inventory.txt', 'new-inventory.txt')
    diff.include?("testfile2\n").must_equal(true)
    diff.include?("testfile1\n").must_equal(false)
  end
end
