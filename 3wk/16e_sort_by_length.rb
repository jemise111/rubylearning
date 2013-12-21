# 16e_sort_by_length.rb
# Which of the following will do an ascending sort by string length.

=begin
    doctest: sort array ascendingly by string length
    >> a = ['bbb', 'a', 'cc']
    >> a.sort { |l, r| l.length <=> r.length }
    => ['a', 'cc', 'bbb']
    >> a.sort_by { |s| s.length }
    => ['a', 'cc', 'bbb']
    doctest: sort array alphabetically
    >> a = ['bbb', 'a', 'cc']
    >> a.sort
    => ['a', 'bbb', 'cc']
    >> a.sort { |l, r| l <=> r }
    => ['a', 'bbb', 'cc']
    >> a.sort_by { |s| s }
    doctest: sort passing block with one argument will throw an error
    >> a = ['bbb', 'a', 'cc']
    >> begin ; a.sort { |s| s } ; rescue => e ; e.class ; end
    => ArgumentError
=end

