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

    describe '#board_setup' do
        context 'draws the board' do
            it 'Draws the structure of the board' do
                expect(new_game.board).to eql("\n -------------\n | 1 | 2 | 3 |\n -------------\n | 4 | 5 | 6 |\n -------------\n | 7 | 8 | 9 |\n -------------\n\n")
            end
        end
    end

    describe '#game_end' do
        context 'Ends the game' do
            it 'Game ends when three player characters are in a row' do
                new_game.move(new_player, 7)
                new_game.move(new_player, 3)
                new_game.move(new_player, 5)
                new_game.move(new_player, 1)
                new_game.move(new_player, 9)
                expect(new_game.ended?).to eql(true)
            end
        end
    end
end

RSpec.describe UserInterface do
    let(:ui) { UserInterface.new }
    describe '#player' do
        context 'call method play' do
            it 'returns nil for each call' do
                expect(ui.play).to eql(nil)
            end
        end
    end
end

RSpec.describe Player do
    let(:new_player) { Player.new('lillian', 'X') }
  
    describe '#name' do
        context 'User details' do
            it 'returns the user name' do
                expect(new_player.name).to be_an_instance_of(String)
            end
        end
    end

    describe '#character' do
        context 'Player\'s symbol' do
            it 'returns the symbol for the player' do
                expect(new_player.character).to be_an_instance_of(String)
            end
        end
    end

    describe '#score' do
        context 'Score returns the score value' do
            it 'returns the integer value of the score' do
                expect(new_player.score).to be_an_instance_of(Integer)
            end
        end
    end
end
