class Square
  attr_accessor :mark
  attr_reader :location

  def initialize(location,mark=" ")
  	@location = location
    @mark = mark
  end

end