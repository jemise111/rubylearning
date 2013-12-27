# 6e_deaf_granny.rb
# Write a deaf granny program according to the given guidelines

# this looks ugly but require_relative caused failing tests

class Granny

  def initialize(name = 'Lilly', deafness = 3, years_remembered = (1930..1950))
    @bye_counter = 0
    @years_remembered = *years_remembered # splat mekes my range an array
    @name = name
    @deafness = deafness
  end

  def response(say_to_granny)
    return if say_to_granny.empty?
    if heard?(say_to_granny)
      "NO, NOT SINCE #{@years_remembered.sample}!"
    else
      'HUH?! SPEAK UP, SONNY!'
    end unless done?(say_to_granny) || say_to_granny == 'BYE' 
  end

  def done?(string=nil)
    if string
      string == 'BYE' ? @bye_counter += 1 : @bye_counter = 0
    end
    @bye_counter >= @deafness
  end

  def greeting
    "Hello Sonny!  Please do speak loudly, Granny #{@name}'s durablecells have died."
  end

  private

  def heard?(string)
    string == string.upcase
  end

end

if __FILE__ == $PROGRAM_NAME
  require './2wk/1c_prompt.rb'
  granny = Granny.new
  puts granny.greeting
  until granny.done?
    puts granny.response(prompt('Say something '))
  end
end

