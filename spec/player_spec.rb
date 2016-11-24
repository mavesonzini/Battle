require 'player'

describe Player do

  subject(:player1) {described_class.new("Malin")}
  subject(:player2) {described_class.new("Veronica")}

    describe '#name' do
      it "should return player's name" do
        expect(player1.name).to eq "Malin"
      end
    end

    describe 'attack' do
      it 'checks player1 responds to attack' do
        expect(player1).to respond_to(:attack)
      end

      it 'checks player2 hp reduces by 10 points' do
        expect{player1.attack(player2)}.to change{player2.hitpoints}.by (-10)
      end
    end


end
