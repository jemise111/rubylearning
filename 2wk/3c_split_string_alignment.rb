# split_string_alignment.rb
# Expand linify exercise so that the line numbers column is 
# formatted properly when there are a greater number of lines

=begin
    doctest: process string line by line using line numbers and format columns
    >> s = "a\nb\nc\nd\ne\nf\ng\nh\ni\nj\nk\n"
    >> linify_with_alignment (s)
    => "Line  1: a
        Line  2: b
        Line  3: c
        Line  4: d
        Line  5: e
        Line  6: f
        Line  7: g
        Line  8: h
        Line  9: i
        Line 10: j
        Line 11: k
        "
=end
def linify_with_alignment string
  string.each_line.with_index(1).map do |line, i|
    'Line ' + sprintf('%*s: ', string.lines.count.to_s.length, i) + line
  end.join
end

s = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Duis imperdiet sem eu quam.
Donec bibendum tincidunt purus.
Nunc eu tellus sed turpis volutpat pellentesque.
Nunc accumsan varius elit.
Aenean sit amet magna eget odio ornare vulputate.
Ut ullamcorper tellus non magna.
Sed non arcu vel libero posuere ultricies.
Suspendisse tincidunt ullamcorper tellus.
In ornare lacus ut turpis.'
puts linify_with_alignment(s)
