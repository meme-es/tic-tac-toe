# player_spec.rb

require './lib/player'
require './lib/game'

RSpec.describe Player do
  let(:game) { Game.new }
  let(:player) { Player.new('Manuel', 'X') }

  describe '#name' do
    context 'when the methodd is called' do
      it 'returns the string name' do
        expect(player.name).to eq('Manuel')
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another thing than the string name of the player" do
        expect(player.name).not_to eq('Foo')
      end
    end
  end

  describe '#character' do
    context 'when the methodd is called' do
      it 'returns the symbol string of the player' do
        expect(player.character).to eq('X')
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another thing than the character of the player" do
        expect(player.character).not_to eq('Y')
      end
    end
  end

  describe '#score' do
    context 'when the method is called' do
      it 'returns the score of the player' do
        game.move(player, 2)
        game.move(player, 3)
        game.move(player, 1)
        game.move(player, 5)
        game.move(player, 9)
        expect(player.score).to be(1)
      end
    end

    context 'when the methodd is called' do
      it "doesn't return another number than the score of the player" do
        game.move(player, 2)
        game.move(player, 3)
        game.move(player, 1)
        game.move(player, 5)
        game.move(player, 9)
        expect(player.score).not_to be(5)
      end
    end
  end
end
