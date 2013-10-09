class Mark
  attr_accessor :successful
  attr_reader :location

  def initialize(player,location)
    @player = player
    @location = location
    @successful = "no"
  end

  def first_coordinate(mark)
    mark.location[0]
  end

end