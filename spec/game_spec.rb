# game_spec.rb

require './lib/player'
require './lib/game'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player) { Player.new('Manuel', 'X') }

  describe '#move' do
    let(:board) { String.new("\n -------------\n | 1 | 2 | 3 |\n -------------\n | 4 | X | 6 |") }

    context 'when the method is called given a Player object and a number' do
      it 'changes the board status' do
        board.concat("\n -------------\n | 7 | 8 | 9 |\n -------------\n\n")
        game.move(player, 5)
        expect(game.board).to eq(board)
      end
    end
  end

  describe '#free?' do
    context 'when the method is called' do
      it 'returns true if the number given as argument is available in the board' do
        expect(game.free?(1)).to be(true)
      end

      it "doesn't return true if the number given as argument isn't available in the board" do
        game.move(player, 5)
        expect(game.free?(5)).not_to be(true)
      end
    end
  end

  describe '#board' do
    let(:initial_board) { String.new("\n -------------\n | 1 | 2 | 3 |\n -------------\n | 4 | 5 | 6 |") }
    let(:after_move_board) { String.new("\n -------------\n | 1 | 2 | 3 |\n -------------\n | 4 | X | 6 |") }

    context 'when the method is called without any movement' do
      it 'returns a string with the initial state of the board' do
        initial_board.concat("\n -------------\n | 7 | 8 | 9 |\n -------------\n\n")
        expect(game.board).to eq(initial_board)
      end
    end

    context 'when the method is called after a movement' do
      it 'returns a string with the current board state after that movement' do
        game.move(player, 5)
        after_move_board.concat("\n -------------\n | 7 | 8 | 9 |\n -------------\n\n")
        expect(game.board).to eq(after_move_board)
      end
    end
  end

  describe '#ended?' do
    context 'when the method is called' do
      it 'returns true if the game is ended' do
        game.move(player, 2)
        game.move(player, 3)
        game.move(player, 1)
        game.move(player, 5)
        game.move(player, 9)
        expect(game.ended?).to be(true)
      end

      it "doesn't return true if the game isn't over" do
        expect(game.ended?).not_to be(true)
      end
    end
  end

  describe '#result' do
    context 'when the method is called' do
      it "returns nil if the game isn't over" do
        expect(game.result).to be(nil)
      end
    end

    context 'when the method is called' do
      it 'returns a string with the result of the game if it has finished' do
        game.move(player, 2)
        game.move(player, 3)
        game.move(player, 1)
        game.move(player, 5)
        game.move(player, 9)
        expect(game.result).to eq('Game over: Manuel with symbol X has won')
      end
    end
  end
end
