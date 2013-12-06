# 3c_text_formatting.rb
# Challenge: write a program to display a multiplication table according to the guidelines given

def multiplication_table n, heading = '', decorate = false
  table = ''
  n.times do |row|
    row += 1                # since index starts at 0
    n.times do |column|
      column += 1           
      width = (column * n).to_s.size
      table<<sprintf(" %*s", width, row * column)
    end
    table<<"\n"
  end
  if decorate
    table.prepend("=" * get_width(n) + "=\n")
    table<<"=" * get_width(n) + "="
  end
  table.prepend(heading.center(get_width(n)) + "\n")
  table
end

def get_width n       # returns width of the last (and largest) row
  width = 0
  n.times do |i|
    i += 1                  
    width += (i * n).to_s.size + 1
  end
  width
end

table1 = multiplication_table(9, 'Times Table to 9', true)
table2 = multiplication_table(20)

puts table1
puts
puts table2