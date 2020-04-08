class Player
  attr_reader :character
  attr_reader :name
  attr_accessor :score

  def initialize(name, character)
    @score = 0
    @name = name
    @character = character
  end
end
