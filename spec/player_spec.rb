require 'player'
describe Player do

  describe '#name' do
    it "should return player's name" do
      expect(subject.name).to eq "Malin"
    end
  end

end
