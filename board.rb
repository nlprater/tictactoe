class Board
  attr_reader :squares

  def initialize
    @squares = []
  end

  def create_squares(size)
    size.times do
      @squares << []
    end
    counter = -1
    @squares.each do |row|
      counter += 1
      size.times do |i|
        row << Square.new([counter, i])
      end
    end
  end

  def square_already_marked?(requested_location)
    @squares[requested_location[0]][requested_location[1]].mark == nil ? false : true
  end

  def mark_square(location, marker)
    @squares[location[0]][location[1]].mark = marker
    p @squares
  end

  def gather_all_paths
    all_paths = []  
    hori = horizontals
    vert = verticals
    diag = diagonals
    hori.each {|path| all_paths << path}
    vert.each {|path| all_paths << path}
    diag.each {|path| all_paths << path}
    all_paths
  end

  def horizontals
    horizontals = []
    size = @squares[0].length
    size.times do |i|
     horizontals << @squares[i].each {|square| square.mark}
    end
    horizontals
  end

  def verticals
    verticals = []
    size = @squares[0].length
    size.times do
     verticals << []
    end
    counter = -1
    size.times do
      counter += 1
      @squares.each do |row|
        verticals[counter] << row[counter].mark
      end
    end
    verticals
  end

  def diagonals
    diag1 = []
    diag2 = []
    diagonals = [diag1,diag2]
    counter1 = 0
    counter2 = -1
    @squares.each do |row|
      diag1 << row[counter1].mark  
      diag2 << row[counter2].mark
      counter1 += 1
      counter2 -= 1
    end
    diagonals
  end

end