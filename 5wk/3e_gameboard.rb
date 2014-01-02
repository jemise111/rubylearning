# 3e_gameboard.rb

class GameBoard
  attr_reader :user_guesses
  def initialize
    @user_guesses = []
    @rating = { 3 => 'Expert',
                4 => 'Pro',
                5 => 'Semi-Pro',
                6 => 'Amateur',
                7 => 'Beginner' }
  end

  def set_locations_cells(locations)
    @locations = locations
  end

  def check_yourself(user_guess)
    if @user_guesses.include?(user_guess.to_i)
      puts "You've already guessed that"
    else
      puts @locations.include?(user_guess.to_i) ? 'Hit' : 'Miss'
      @user_guesses.push(user_guess.to_i)
    end unless invalid_input?(user_guess)
    if game_over?
      puts 'End'
      puts "Level: #{choose_rating(@user_guesses.size)}"
    end
    game_over? && 'kill' || user_guess
  end

  # add 'private' here but then can't test
  def invalid_input?(guess)
    guess.to_s.length > 1 || guess =~ /[^[0-7]]/
  end

  def game_over?
    @locations.map { |g| @user_guesses.include?(g) }.all?
  end

  def choose_rating(guesses)
    @rating.key?(guesses) ? @rating[guesses] : @rating[@rating.keys.max]
  end
end
