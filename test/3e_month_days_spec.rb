require 'minitest/autorun'
require_relative '../7wk/3e_month_days'

describe 'month_days' do
  it 'must return number of days in month and year' do
    month_days(5).must_equal(31)
    month_days(2, 2001).must_equal(28)
  end

  it 'must return number of days in month and leap year' do
    month_days(2, 2000).must_equal(29)
  end
end
