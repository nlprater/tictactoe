class Display
   
  def welcome_message
  	puts
    puts "Welcome to Tic Tac Toe."
    puts
  end

  def how_many_players_message
    puts "How many players? (integer please, not the word 'two')"
    puts
  end

  def board_size_message
    puts "Cool. How big would you like the board to be?  Enter the length of one of the sides, also as an integer."
    puts
  end

  def invalid_setup_info_message
    puts "That wasn't valid input, please enter a whole number."
  end

  def initial_user_entry_message(player)
    puts "Ok, let's do this.  #{player.name}, what square would you like to mark? Lower-case, letter then number (ex. a1)"
    puts
  end

  def user_entry_message(player)
    puts "#{player.name}, what square would you like to mark?"
    puts
  end

  def user_entry_message(player)
    puts "#{player.name}, which square would you like to mark?"
    puts
  end

  def location_does_not_exist_message
    puts "That location doesn't exist on the board.  Please select another location."
    puts
  end

  def square_already_marked_message
    puts "that's already marked, enter another"
    puts
  end

  def game_over_winner_message(player)
    puts "That will do it, #{player.name} is victorious!"
    puts
  end

  def game_over_stalemate_message
    puts "You've battled to a stalemate!"
    puts
  end

  def board(board)
  	puts
  	board.squares.each do |row|
      row.each do |square|
      	print " " + square.mark + " "
      end
      print "\n"
      puts
    end
    puts
  end

end