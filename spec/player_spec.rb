require 'player'

describe Player do

  subject(:player) {described_class.new}

    describe '#name' do
      it "should return player's name" do
        expect(player.name).to eq Player::DEFAULT_NAME
      end
    end

    describe '#dead?' do
      it "should return true if player is dead" do
        player.reduce_hitpoints(100)
        expect(player.dead?).to eq true
      end

      it "should return false if player is alive" do
        expect(player.dead?).to eq false
      end
    end

end
