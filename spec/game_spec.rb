require_relative '../lib/game'
require './lib/userinterface'
require './lib/player'


RSpec.describe Game do

    let(:new_game) {Game.new}
    let(:new_player) {Player.new('Lillian A', 'X')}
    
    describe '#start_game' do
        context 'Game initialisation' do

            it 'Correctly innitialises the game' do
                expect(new_game.ended?).to eql(false)
                expect(new_game.moves).to eql(0)
            end
        end
    end

    describe '#player_move' do
        context 'When a player wants to make a move' do
            it 'When a new player makes a move' do
                expect(new_game.move(new_player, 3)).to eql(nil)
            end
        end
    end

    describe '#number_availability' do
        context 'Checks for the number availability' do
            it 'returns true if number chosen by player is available for use' do
                expect(new_game.free?(3)).to eql(true)
            end
        end
    end
end