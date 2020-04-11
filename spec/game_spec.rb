# game_spec.rb

require './lib/player'
require './lib/game'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player) { Player.new('Manuel', 'X') }

  describe '#move' do
    context 'when the method is called' do
      it 'sets a bunch of variables according to comparisons and returns nil always' do
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
    context 'when the method is called' do
      it 'returns a string with the current board status' do
        expect(game.board).to be_an_instance_of(String)
      end
    end

    context 'when the method is called' do
      it "doesn't return another instance than a String with the current board status" do
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
        expect(game.result).to be_an_instance_of(String)
      end
    end
  end
end
