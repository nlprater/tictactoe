require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'square.rb'
require_relative 'view.rb'
require_relative 'mark.rb'

class TicTacToeController
  attr_reader :players,:board
  attr_writer :board

  def initialize(game)
    @game = game
  end

  def play(player,user_input)
	requested_mark = @game.interpret_user_input(player,user_input)
    if @game.does_location_exist?(requested_mark.location)
		if @game.board.square_already_marked?(requested_mark.location)
		  requested_mark.successful = "no"
		  @game.display.square_already_marked_message
		  response = gets.chomp
		  play(player,response)
		else
		  @game.board.mark_square(requested_mark.location,player.marker)
		  @game.display.board(@game.board)
		end
		  
		if @game.result == "winner"
		  @game.display.game_over_winner_message(player)
		elsif @game.result == "stalemate"
		  @game.display.game_over_stalemate_message
		else
		  next_player = @game.find_next_player(player)
		  @game.display.user_entry_message(next_player)
		  response = gets.chomp
		  play(next_player,response)
		end
	else
		@game.display.location_does_not_exist_message
		response = gets.chomp
		play(player,response)
	end
  end

end

#==============================================================

@game = Game.new
@game.initialize_session










