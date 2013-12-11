# 3c_text_formatting.rb
# Challenge: write a program to display a multiplication table according to the
# guidelines given

def multiplication_table(n, heading = '', decorate = false)
  prepare_result_string
  build_the_table(n)
  decoration(n) if decorate
  heading(n, heading)
  @table
end

def prepare_result_string
  @table = ''
end

=begin
    doctest: returns a multiplication table for n with a space in the first column
    # testing edge case
    >> @table = ''
    >> build_the_table(0)
    => " 0\n"
    >> @table = ''
    >> build_the_table(2)
    => " 1 2\n 2 4\n"
=end
def build_the_table n
   if n == 0
     n += 1
     @table << " 0\n"
   else
     n.times do |row|
       row += 1                # since index starts at 0
       n.times do |column|
         column += 1
         width = (column * n).to_s.size
         @table << sprintf(' %*s', width, row * column)
       end
       @table << "\n"
     end
   end
   @table                      # not sure why this is necessary but test fails without it
end

=begin
    doctest: decorates table with equal signs
    >> @table = " 1 2\n 2 4\n"
    >> decoration(2)
    => "=====\n 1 2\n 2 4\n====="
=end
def decoration n
  @table.prepend('=' * get_width(n) + "=\n")
  @table << '=' * get_width(n) + '='
end

=begin
    doctest: prepends table with centered heading
    >> @table = " 1 2\n 2 4\n"
    >> heading(2, "m 2")
    => " m 2 \n 1 2\n 2 4\n"
=end
def heading n, heading
  @table.prepend(heading.center(get_width(n) + 1) + "\n")   # add 1 to width for trailing "="   
end

=begin
    doctest: returns width of last (and largest row in the table)
    >> get_width(4)
    => 10
=end
def get_width(n)      # returns width of the last (and largest) row
  width = 0
  n.times do |i|
    i += 1
    width += (i * n).to_s.size + 1
  end
  width
end

[
  multiplication_table(9, 'Times table to 9', true),
  multiplication_table(20),
  multiplication_table(1, 'm', true),
  multiplication_table(0),
].each do |result|
  puts result
  puts
end
