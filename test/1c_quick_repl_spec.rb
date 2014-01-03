require 'minitest/autorun'
require_relative '../5wk/1c_quick_repl'

describe 'quick repl' do
  it 'must display return of expression' do
    expression = "puts 'hi'"
    evaluate(expression).must_equal('nil')
    expression = '3 > 2 && 5 - 1 < 8'
    evaluate(expression).must_equal('true')
    expression = '6 * 4'
    evaluate(expression).must_equal('24')
  end
end
