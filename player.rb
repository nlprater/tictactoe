class Player
  attr_reader :marker,:name

  def initialize(name,marker)
    @name = name
    @marker = marker
    @marks = []
  end

end