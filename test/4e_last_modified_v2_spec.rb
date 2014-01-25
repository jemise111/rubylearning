require 'minitest/autorun'
require_relative '../7wk/4e_last_modified_v2'

describe 'last_modified' do
  it 'must contain files in current directory' do
    file_list.must_include('./Gemfile')
  end
end
