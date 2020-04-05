class Game
  attr_reader :result

  def initialize
    @moves = 0
    @ended = false
    @board = Array.new(3) { Array.new(3) }
  end

  # checking availability
  def free?(num)
    index = map(num)
    @board[index[0]][index[1]].nil?
  end

  # making a move
  def move(player, num)
    index = map(num)
    @board[index[0]][index[1]] = player.character
  end

  def map(num)
    [(num - 1) / 3, (num - 1) % 3]
  end
end
