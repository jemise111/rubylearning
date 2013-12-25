# 6e_deaf_granny.rb
# Write a deaf granny program according to the given guidelines

require "#{Dir.pwd}/../2wk/1c_prompt.rb"

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

=begin
    doctest: return false if doesn't receive n consecutive 'BYE's
    >> @bye_counter = 0
    >> ['BYE', 'Hi', 'BYE', 
        'BYE', 'BYE'].map { |s| consecutive_bye(3, s) }
    => [false, false, false, false, true]
=end
def consecutive_bye n, string
  string == 'BYE' ? @bye_counter += 1 : @bye_counter = 0
  @bye_counter >= n
end

if __FILE__ == $PROGRAM_NAME
  puts "Hello Sonny!  Please do speak loudly, my durablecells have died." 
  @bye_counter = 0
  question = 'What would you like to say to deaf granny?'
  until consecutive_bye(3, say_to_granny = prompt(question, 1))
    puts granny_response(say_to_granny)
  end
end
