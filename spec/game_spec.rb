require 'game'
require 'player'

describe Game do

  let(:player1) { double(:player1, hitpoints: 100) }
  let(:player2) { spy(:player2, hitpoints: 100) }

  subject(:game) { described_class.new(player1, player2) }

  describe 'attack' do

    it { is_expected.to respond_to(:attack).with(1).argument }

    it "reduces the attacked player's hitpoints by 10" do
      game.attack(player2)
      expect(player2.to have_received(:reduce_hitpoints).with(10))
    end
  end

end
