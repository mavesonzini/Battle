require 'game'
require 'player'

describe Game do

  let(:player1) { double(:player1, hitpoints: 100) }
  let(:player2) { spy(:player2, hitpoints: 100) }

  subject(:game) { described_class.new(player1, player2) }

  describe '#attack' do

    it { is_expected.to respond_to(:attack).with(1).argument }

    it "reduces the attacked player's hitpoints by 10" do
      game.attack(player2)
      expect(player2.to have_received(:reduce_hitpoints).with(20))
    end
  end

  describe '#switch_player' do
    it { is_expected.to respond_to(:switch_player) }

    it "should return true when is player1's turn" do
      expect(game.turn).to eq true
    end

    it "should return false when is player2's turn" do
      game.switch_player
      expect(game.turn).to eq false
    end
  end

end
