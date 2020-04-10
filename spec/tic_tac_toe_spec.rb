# tic_tac_toe-spec.rb

require './lib/userinterface'
require './lib/player'

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
