class Game
  attr_accessor :board
  attr_reader :players,:display

  ALPHABET_TO_NUM = {"a" => 0,"b" => 1,"c" => 2,"d" => 3,"e" => 4,"f" => 5,"g" => 6,"h" => 7,"i" => 8,"j" => 9,"k" => 10}
  
  def initialize
    @board = Board.new
    @players = []
    @display = Display.new
    @markers = ["I","A","M","T","H","E","O","X"]
  end

  def initialize_session
    @display.welcome_message 
    @display.how_many_players_message
    create_players(gets.chomp)
    @display.board_size_message
    create_board(gets.chomp)
    session = TicTacToeController.new(self)
    @display.initial_user_entry_message(@players.first)
    user_input = gets.chomp
    session.play(@players.first,user_input)
  end

  def create_players(num_players)
    if positive_integer_not_equal_to_zero?(num_players)
    	num_players_int = num_players.to_i
      create_player_array(num_players_int)
    else
      display.invalid_setup_info_message
      response = gets.chomp
      create_players(response)
    end
  end

  def create_player_array(num_players)
    num_players.times {|i| @players << Player.new("Player #{i+1}",grab_player_marker)}
  end

  def grab_player_marker
    @markers.pop
  end

  def create_board(board_size)
    if positive_integer_not_equal_to_zero?(board_size)
      @board.create_squares(board_size.to_i)
    else
      display.invalid_setup_info_message
      response = gets.chomp
      create_board(response)
    end
  end

  def positive_integer_not_equal_to_zero?(string_input)
    /^[1-9][0-9]*$/.match(string_input) ? true : false
  end

  def interpret_user_input(player,user_input)
    location = [nil,nil]
    user_input.each_char do |char|
      if ALPHABET_TO_NUM[char]
        location[1] = ALPHABET_TO_NUM[char]
      else
        location[0] = char.to_i - 1
      end
    end
    Mark.new(player,location)
  end

  def find_next_player(player)
    player_hash = Hash[@players.map.with_index.to_a]
    position = player_hash[player]
    num_players = @players.length
    if position == num_players - 1
      @players[0]
    else
      @players[position + 1]
    end
     
  end

  def result
    result = ""
    stalemate_array = []
    paths = @board.gather_all_paths

    paths.each do |path|
      result << "winner" if path.uniq.length == 1 && path.include?(nil) == false
    end

    paths.each do |path|
      stalemate_array << "stalemate" if path.uniq.length >= 2
    end

    if stalemate_array.length == paths.length
      result << "stalemate"
    end

    if result != ""
      return result
    else
      return false
    end
  end

end