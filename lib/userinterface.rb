require './lib/game'
require './lib/player'

class UserInterface
  def play
    player1 = new_player(nil, 'first')
    player2 = new_player(player1, 'second')
    current = player1
    loop do
      game = Game.new
      loop do
        Gem.win_platform? ? (system 'cls') : (system 'clear')
        print game.board
        puts "Turn of #{current.name}(#{current.character})"

        number = choose_number(game)
        game.move(current, number)
        current = current == player1 ? player2 : player1

        break if game.ended?
      end
      Gem.win_platform? ? (system 'cls') : (system 'clear')
      print game.board
      puts game.result

      break unless keep_playing?
    end
  end

  private

  def new_player(player, nth_player)
    the_name = choose_name(player, nth_player)
    the_symbol = choose_symbol(player)
    Player.new(the_name, the_symbol)
  end

  def choose_name(player, nth_player)
    new_name = nil
    loop do
      print "Please introduce the #{nth_player} player's name: "
      new_name = gets.chomp

      if !player.nil? && new_name.eql?(player.name)
        puts 'The name you entered is already taken so...'
        next
      end

      break unless new_name.nil? || new_name.empty?
    end
    new_name
  end

  def choose_symbol(player)
    if player.nil?
      loop do
        print 'Please choose one of the symbols X/O: '
        the_symbol = gets.chomp
        the_symbol.upcase!

        return the_symbol if 'X'.include?(the_symbol) || 'O'.include?(the_symbol)

        error_message
      end
    else
      player.character == 'X' ? 'O' : 'X'
    end
  end

  def keep_playing?
    loop do
      print 'Do you want keep playing y/n: '
      answ = gets.chomp
      return true if answ.upcase == 'Y'
      return false if answ.upcase == 'N'

      error_message
    end
  end

  def choose_number(game)
    loop do
      print "Choose a number between 1-9 that's hasn't been taken: "
      answ = gets.chomp
      return answ.to_i if answ.integer? && answ.to_i.between?(1, 9) && game.free?(answ.to_i)

      error_message
    end
  end

  def error_message
    print "Sorry I didn't get you right...\n"
  end
end

class String
  def integer?
    to_i.to_s == self
  end
end
