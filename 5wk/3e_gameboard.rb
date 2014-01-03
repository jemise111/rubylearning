# 3e_gameboard.rb

class GameBoard
  def initialize
    @user_guesses = []
  end

  def set_locations_cells(locations)
    # user_guess will always be string without validation
    # so locations must match
    @locations = locations.map { |l| l.to_s }
  end

  def check_yourself(user_guess)
    if !@locations.nil? # locations have been set
      @user_guesses.push(user_guess)
      if game_over?(user_guess)
        puts 'End'
        'kill'
      else
        puts @locations.include?(user_guess) ? 'Hit' : 'Miss'
      end
    else
      puts 'You must set at least one location before this game can be played'
      'kill'
    end
  end

  # add 'private' here but then can't test

  def game_over?(user_guess)
    @locations.map { |g| @user_guesses.include?(g) }.all? ||
      user_guess == 'kill'
  end
end
