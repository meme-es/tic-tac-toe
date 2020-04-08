class Game
  attr_reader :result

  def initialize
    @moves = 0
    @ended = false
    @board = Array.new(3) { Array.new(3) }
  end

  def free?(num)
    index = map(num)
    @board[index[0]][index[1]].nil?
  end

  def move(player, num)
    index = map(num)
    @board[index[0]][index[1]] = player.character
    @moves += 1

    if @moves.between?(6, 8) && winner?(player, index)
      @ended = true
      player.score += 1
      @result = "Game over: #{player.name} with symbol #{player.character} has won"
    elsif @moves == 9
      @ended = true
      @result = 'Game over: Tie'
    end
  end

  def board
    str = "\n -------------\n"
    (0..2).each do |row|
      (0..2).each do |column|
        tmp = @board[row][column]
        str += if tmp.nil?
                 ' | ' + (3 * row + column + 1).to_s
               else
                 ' | ' + tmp
               end
      end
      str += " |\n -------------\n"
    end
    str += "\n"
  end

  def ended?
    @ended
  end

  private

  def map(num)
    [(num - 1) / 3, (num - 1) % 3]
  end

  def winner?(player, index)
    tmp_array = @board[index[0]]
    return true if tmp_array.all? { |item| item == player.character }

    tmp_array = @board.transpose[index[1]]
    return true if tmp_array.all? { |item| item == player.character }

    tmp_array = (0..2).collect { |i| @board[i][i] }
    return true if tmp_array.all? { |item| item == player.character }

    tmp_array = (0..2).collect { |i| @board[i][-1 * (i - 2)] }
    return true if tmp_array.all? { |item| item == player.character }

    false
  end
end
