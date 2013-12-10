# 3c_text_formatting.rb
# Challenge: write a program to display a multiplication table according to the
# guidelines given

def multiplication_table(n, heading = '', decorate = false)
  table = ''
  # special case when n = 0
  if n == 0
    n += 1
    table << " 0\n"
  else
    n.times do |row|
      row += 1                # since index starts at 0
      n.times do |column|
        column += 1
        width = (column * n).to_s.size
        table << sprintf(' %*s', width, row * column)
      end
      table << "\n"
    end
  end
  if decorate
    table.prepend('=' * get_width(n) + "=\n")
    table << '=' * get_width(n) + '='
  end
  table.prepend(heading.center(get_width(n) + 1) + "\n")   # add 1 to width for trailing "="   
  table
end

def get_width(n)      # returns width of the last (and largest) row
  width = 0
  n.times do |i|
    i += 1
    width += (i * n).to_s.size + 1
  end
  width
end

[
  multiplication_table(9, 'Times Table to 9', true),
  multiplication_table(20),
  multiplication_table(1, 'm', true),
  multiplication_table(0),
].each do |result|
  puts result
  puts
end
