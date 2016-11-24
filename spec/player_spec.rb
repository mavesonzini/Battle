require 'player'

describe Player do

  subject(:player1) {described_class.new("Malin")}
  subject(:player2) {described_class.new("Veronica")}

    describe '#name' do
      it "should return player's name" do
        expect(player1.name).to eq "Malin"
      end
    end



end
