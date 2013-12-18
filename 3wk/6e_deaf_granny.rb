# 6e_deaf_granny.rb
# Write a deaf granny program according to the given guidelines

=begin
    doctest: return true if string is all uppercase, false otherwise
    >> ['HI', 'HI!',
        'HI GRANNY', 'HI GRANNY 4!'
        ].map { |s| shouted?(s) }.all?
    => true
    >> ['Hi', 'Hi!',
        'HI GRaNNY', 'Hi GRANNY 4!'
        ].map { |s| shouted?(s) }.all?
    => false
=end
def shouted? string
  string == string.upcase
end

=begin
    doctest: if shouted returns granny exclamation, otherwise 
             told to speak up
    >> granny_response('Hi')
    => 'HUH?! SPEAK UP, SONNY!'
    # use seed here for testing
    >> granny_response('HI')
    => "NO, NOT SINCE 1950!"
=end
def granny_response say_to_granny
  if shouted?(say_to_granny)
    "NO, NOT SINCE #{1930 + rand(20)}!"
  else
    'HUH?! SPEAK UP, SONNY!'
  end
end

if __FILE__ == $PROGRAM_NAME
  say_to_granny = ''
  until say_to_granny == 'BYE'    # should use conditional assignment here
    puts 'What would you like to say to deaf granny?'
    say_to_granny = gets.chomp
    puts granny_response(say_to_granny)
  end
end
