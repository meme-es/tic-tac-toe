# tic_tac_toe-spec.rb

require './lib/userinterface'
require './lib/player'
require './lib/game'

RSpec.describe UserInterface do
  let(:interface) { UserInterface.new }

  describe '#play' do
    context 'when the method is called' do
      it 'returns nil allways' do
        expect(interface.play).to be(nil)
      end
    end
  end
end

RSpec.describe Player do
  let(:player) { Player.new('Manuel', 'X') }

  describe '#name' do
    context 'when the methodd is called' do
      it 'returns the string name' do
        expect(player.name).to be_an_instance_of(String)
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another instance than a String" do
        expect(player.name).not_to be_an_instance_of(Integer)
      end
    end
  end

  describe '#character' do
    context 'when the methodd is called' do
      it 'returns the symbol string of the player' do
        expect(player.character).to be_an_instance_of(String)
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another instance than a String" do
        expect(player.character).not_to be_an_instance_of(Integer)
      end
    end
  end

  describe '#score' do
    context 'when the method is called' do
      it 'returns the symbol integer scroe of the player' do
        expect(player.score).to be_an_instance_of(Integer)
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another instance than an Integer" do
        expect(player.score).not_to be_an_instance_of(String)
      end
    end
  end
end

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player) { Player.new('Manuel', 'X') }

  describe '#move' do
    context 'when the method is called' do
      it 'returns nil always' do
        expect(game.move(player, 5)).to be(nil)
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
    let(:board) { String.new("\n -------------\n | 1 | 2 | 3 |\n -------------\n | 4 | 5 | 6 |") }
    let(:board2) { String.new("\n -------------\n | 1 | 2 | 3 |\n -------------\n | 4 | X | 6 |") }

    context 'when the method is called' do
      it 'returns a string with the current board status' do
        board.concat("\n -------------\n | 7 | 8 | 9 |\n -------------\n\n")
        expect(game.board).to eq(board)
      end
    end

    context 'when the method is called' do
      it 'returns a string with the current board status' do
        game.move(player, 5)
        board2.concat("\n -------------\n | 7 | 8 | 9 |\n -------------\n\n")
        expect(game.board).to eq(board2)
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another instance than a String" do
        expect(game.board).not_to be_an_instance_of(Integer)
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

      it "doesn't return true if the game isn't ended" do
        expect(game.ended?).not_to be(true)
      end
    end
  end
end
