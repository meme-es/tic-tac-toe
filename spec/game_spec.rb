require_relative '../lib/game'

RSpec.describe Game do
    
    describe '#game_engine' do
        context 'Game initialisation' do

            it 'Correctly innitialises the game' do
                game = Game.new
                expect(game.ended?).to eql(false)
                expect(game.moves).to eql(0)
            end
        end
    end
end