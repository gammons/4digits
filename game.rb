require_relative 'guess_parser'
class Game
  TotalGuesses = 10
  def play
    generate_computer_number
    guess_count = 0

    human_guesses = []

    while !won? and guess_count < TotalGuesses do
      guess = get_human_guess # output format like [1,2,3,4]
      parse_human_guess # this will get the number of squares and circles
      output_results_on_screen
      get_computer_guess
      get_human_response_from_guess
      determine_winner
    end
  end

  def won?
    false
  end

end
