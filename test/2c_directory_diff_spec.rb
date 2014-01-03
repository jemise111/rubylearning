require 'minitest/autorun'
require_relative '../5wk/2c_directory_diff'

describe 'directory diff' do
  it "must show difference in 2 arrays' contents" do
    old_files = ["test1.txt\n", "test2.txt\n"]
    new_files = ["test2.txt\n", "test3.txt\n"]
    diff = "- test1.txt\n+ test3.txt\n"
    difference(old_files, new_files).must_equal(diff)
  end
end
