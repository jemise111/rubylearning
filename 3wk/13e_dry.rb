# 13e_dry.rb
# Re-write the following code in one line, the DRY way.

# The Long way
record = Hash.new
record[:name] = 'Satish'
record[:email] = 'mail@satishtalim.com'
record[:phone] = '919371006659'

# The DRY way
record2 = {name: 'Satish', email: 'mail@satishtalim.com', phone: '919371006659'}

# Test for equality
puts record == record2
